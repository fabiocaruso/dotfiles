local config = function()
	vim.lsp.handlers["textDocument/references"] = require('nice-reference').reference_handler
end

local M = {
	'wiliamks/nice-reference.nvim',
	config = config,
	enabled = false,
	keymaps = {
		--{
		--'n',
		--'<leader>gr',
		--function()
		--vim.cmd('NiceReference')
		--end,
		--{ noremap = true },
		--description = "Lsp show references",
		--},
	},
};

return M;
