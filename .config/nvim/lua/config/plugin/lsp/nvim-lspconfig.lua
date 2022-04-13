local config = function()
	local utils = require('config.utils');
	-- Icons
	local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
	for type, icon in pairs(signs) do
		local hl = "DiagnosticSign" .. type
		vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
	end
	-- Options
	vim.diagnostic.config({
		--[[virtual_text = {
		prefix = '●', -- Could be '■', '▎', 'x'
		}]]--
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
			function ()
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
		{
			'n',
			'<leader>gr',
			function ()
				vim.cmd('NiceReference')
			end,
			{ noremap = true },
			description = "Lsp show references",
		},
	},
};

return M;
