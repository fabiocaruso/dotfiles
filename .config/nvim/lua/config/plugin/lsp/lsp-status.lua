local config = function()
	local gc = _G._config
	local lsp_status = require('lsp-status')
	lsp_status.register_progress()
	lsp_status.config({
		current_function = false,
		show_filename = false,
		diagnostics = false,
		status_symbol = '',
	})
	--gc.lsp.capabilities = vim.tbl_extend('keep', gc.lsp.capabilities, lsp_status.capabilities)
	table.insert(gc.lsp.on_attach, lsp_status.on_attach)
end

local M = {
	'nvim-lua/lsp-status.nvim',
	config = config,
	enabled = false,
};

return M;
