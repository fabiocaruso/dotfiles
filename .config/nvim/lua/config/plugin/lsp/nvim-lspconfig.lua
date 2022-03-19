local config = function()
	local utils = require('config.utils');
	-- Icons
	local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
	for type, icon in pairs(signs) do
		local hl = "DiagnosticSign" .. type
		vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
	end
	vim.diagnostic.config({
		virtual_text = {
			prefix = '●', -- Could be '■', '▎', 'x'
		}
	})
	-- Options
	
	-- Handlers
	vim.lsp.handlers["textDocument/definition"] = utils.goto_definition('vsplit')
	vim.lsp.handlers["textDocument/implementation"] = utils.goto_definition('vsplit')
end

local M = {
	'neovim/nvim-lspconfig',
	config = config,
};

return M;
