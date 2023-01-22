local run_nearest_codelens = function(client_side, command)
	local bufnr = vim.fn.bufnr()
	local nearest_lens = nil
	local nearest_row_start, nearest_row_end = 1, vim.fn.getbufinfo(bufnr)[1].linecount
	for _, lens in ipairs(vim.lsp.codelens.get(bufnr)) do
		local lens_range = lens.range
		local lens_start = lens_range.start
		local _ = lens_range['end']
		local lens_node = vim.treesitter.get_node_at_pos(bufnr, lens_start.line, 0)
		local row_start, _, row_end, _ = lens_node:range()
		local cusor_row, cursor_col = unpack(vim.api.nvim_win_get_cursor(0))
		local cursor_in_node = vim.treesitter.is_in_node_range(lens_node, cusor_row - 1, cursor_col - 1)
		local cmd = lens.command.command
		if nearest_row_start <= row_start and nearest_row_end >= row_end and cursor_in_node and cmd == command then
			nearest_row_start = row_start
			nearest_row_end = row_end
			nearest_lens = lens
		end
	end
	if nearest_lens == nil then
		return
	end
	if client_side and vim.lsp.commands[command] then
		vim.lsp.commands[command](nearest_lens.command)
	else
		vim.lsp.buf.execute_command(nearest_lens.command)
	end
end

local config = function()
	local gc = _G._config
	local utils = require('config.utils');
	local lsp_config = require('lspconfig');
	-- InlayHints
	require("lsp-inlayhints").setup({
		inlay_hints = {
			highlight = "Comment",
		},
	})
	vim.api.nvim_create_augroup("LspAttach_inlayhints", {})
	vim.api.nvim_create_autocmd("LspAttach", {
		group = "LspAttach_inlayhints",
		callback = function(args)
			if not (args.data and args.data.client_id) then
				return
			end
			local bufnr = args.buf
			local client = vim.lsp.get_client_by_id(args.data.client_id)
			require("lsp-inlayhints").on_attach(client, bufnr)
		end,
	})
	-- CodeLens
	vim.api.nvim_create_augroup("LspAttach_codelens", {})
	vim.api.nvim_create_autocmd("LspAttach", {
		group = "LspAttach_codelens",
		callback = function(args)
			local bufnr = args.buf
			local client = vim.lsp.get_client_by_id(args.data.client_id)
			--print(client.name)
			--print(vim.inspect(client.server_capabilities))
			vim.api.nvim_set_hl(0, "LspCodeLens", { link = "Comment" })
			vim.api.nvim_set_hl(0, "LspCodeLensSeparator", { link = "Comment" })
			if client.server_capabilities['codeLensProvider'] ~= nil then
				vim.api.nvim_create_augroup("codelens", {})
				vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold", "InsertLeave" }, {
					group = "codelens",
					buffer = bufnr,
					callback = function(_)
						vim.lsp.codelens.refresh()
					end,
				})
			end
		end,
	})
	-- Semantic Tokens
	--if vim.version().prerelease then
	--require("nvim-semantic-tokens").setup()
	--local lsp_augroup = vim.api.nvim_create_augroup("LspAttach_SemanticTokens", {})
	--vim.api.nvim_create_autocmd("LspAttach_TextChanged", {
	--group = lsp_augroup,
	--callback = function(args)
	--local bufnr = args.buf
	--local client = vim.lsp.get_client_by_id(args.data.client_id)
	--local caps = client.server_capabilities
	--if caps.semanticTokensProvider and caps.semanticTokensProvider.full then
	--local augroup = vim.api.nvim_create_augroup("SemanticTokens", {})
	--vim.api.nvim_create_autocmd("TextChanged", {
	--group = augroup,
	--buffer = bufnr,
	--callback = function()
	--vim.lsp.buf.semantic_tokens_full()
	--end,
	--})
	---- fire it first time on load as well
	--vim.lsp.buf.semantic_tokens_full()
	--end
	--end,
	--})
	--end
	-- Generates a default config for all lsp servers
	local generate_config = function(server_name)
		local opts = {}
		opts.on_attach = utils.merge_fns(gc.lsp.on_attach)
		opts.capabilities = gc.lsp.capabilities
		opts.capabilities.textDocument.completion.completionItem.snippetSupport = true
		opts.capabilities.textDocument.codeLens = { dynamicRegistration = true }
		--print(vim.inspect(opts.capabilities))
		local ls_config = gc.lsp.ls[server_name]
		if ls_config ~= nil then
			opts = vim.tbl_deep_extend("keep", opts, ls_config)
		end
		--if server_name == "rust_analyzer" then
		--print(vim.inspect(opts.capabilities))
		--end
		opts.capabilities.offsetEncoding = { "utf-16" }
		return opts
	end
	-- Register an init function for other plugins
	gc.lsp.init_server = function(server_name)
		lsp_config[server_name].setup(generate_config(server_name))
	end
	-- Icons
	--local set_signs = function()
	local config_signs = gc.lsp.appearance.signs
	local signs = {
		Error = config_signs.error.sym .. " ",
		Warn = config_signs.warning.sym .. " ",
		Hint = config_signs.hint.sym .. " ",
		Info = config_signs.information.sym .. " "
	}
	for type, icon in pairs(signs) do
		local hl = "DiagnosticSign" .. type
		-- FIXME: Hacky solution
		--local col_bg = "#" .. string.format("%06x", vim.api.nvim_get_hl_by_name("SignColumn", true).background)
		--local col_fg = "#" .. string.format("%06x", vim.api.nvim_get_hl_by_name("Diagnostic" .. type, true).foreground)
		-- TODO: Needs a neo-tree filter
		--vim.api.nvim_set_hl(0, "DiagnosticSign" .. type, { fg = col_fg, bg = col_bg })
		vim.fn.sign_define(hl, { text = icon, texthl = hl })
	end
	--end
	-- TODO: Check which plugin sets these globally ffs
	--vim.schedule(set_signs)
	-- Options
	vim.diagnostic.config({
		--[[virtual_text = {
		prefix = '●', -- Could be '■', '▎', 'x'
		}]] --
		virtual_text = false,
		signs = true,
		underline = true,
		float = { border = "none" },
	})
	vim.o.updatetime = 250
	vim.cmd [[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false, scope="cursor"})]]
	-- Handlers
	vim.lsp.handlers["textDocument/definition"] = utils.goto_definition('vsplit')
	vim.lsp.handlers["textDocument/implementation"] = utils.goto_definition('vsplit')
end

local M = {
	'neovim/nvim-lspconfig',
	config = config,
	requires = {
		{
			'lvimuser/lsp-inlayhints.nvim',
			--branch = 'anticonceal',
		},
		--{
		--'theHamsta/nvim-semantic-tokens',
		--}
	},
	keymaps = {
		{
			'n',
			'<leader>rn',
			vim.lsp.buf.rename,
			{ noremap = true },
			description = "Lsp rename",
		},
		{
			'n',
			'<leader>a',
			vim.lsp.buf.code_action,
			{ noremap = true },
			description = "Lsp toggle code action",
		},
		{
			'n',
			'<leader>h',
			vim.lsp.buf.hover,
			{ noremap = true },
			description = "Lsp toggle hover",
		},
		{
			'n',
			'<leader>gd',
			vim.lsp.buf.definition,
			{ noremap = true },
			description = "Lsp go to definition",
		},
		{
			'n',
			'<leader>cr',
			vim.lsp.codelens.run,
			{ noremap = true },
			description = "Lsp run codelens",
		},
		{
			'n',
			'<leader>rt',
			function()
				if vim.bo.filetype == 'go' then
					run_nearest_codelens(false, 'gopls.test')
				elseif vim.bo.filetype == 'rust' then
					run_nearest_codelens(true, 'rust-analyzer.runSingle')
				end
			end,
			{ noremap = true },
			description = "Lsp run nearest test",
		},
		{
			'n',
			'<leader>gi',
			function()
				vim.cmd([[
					TroubleClose
				]])
				vim.lsp.buf.implementation()
			end,
			{ noremap = true },
			description = "Lsp go to implementation",
		},
		{
			'i',
			'<C-s>',
			vim.lsp.buf.signature_help,
			{ noremap = true },
			description = "Lsp show signature help",
		},
	},
};

return M;
