local config = function()
	vim.lsp.handlers["textDocument/references"] = require('nice-reference').reference_handler
end

local M = {
	'wiliamks/nice-reference.nvim',
	config = config,
};

return M;
