local config = function()
	local gc = _G._config
	local utils = require('config.utils');
	local lsp_config = require('lspconfig');
	-- Generates a default config for all lsp servers
	local generate_config = function(server_name)
		local opts = {}
		opts.on_attach = utils.merge_fns(gc.lsp.on_attach)
		opts.capabilities = gc.lsp.capabilities
		local ls_config = gc.lsp.ls[server_name]
		if ls_config ~= nil then
			opts = vim.tbl_deep_extend("keep", opts, ls_config)
		end
		-- TODO: temporary fix for clangd
		if server_name == "clangd" then
			opts.capabilities.offsetEncoding = "utf-16"
		end
		return opts
	end
	-- Register an init function for other plugins
	gc.lsp.init_server = function(server_name)
		lsp_config[server_name].setup(generate_config(server_name))
	end
	-- Icons
	local config_signs = gc.lsp.appearance.signs
	local signs = {
		Error = config_signs.error .. " ",
		Warn = config_signs.warning .. " ",
		Hint = config_signs.hint .. " ",
		Info = config_signs.information .. " "
	}
	for type, icon in pairs(signs) do
		local hl = "DiagnosticSign" .. type
		vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
	end
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
