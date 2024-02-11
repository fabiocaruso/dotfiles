local config = function()
	require('treesitter-context').setup()
end

local M = {
	"nvim-treesitter/nvim-treesitter-context",
	config = config,
	keymaps = {},
}

return M
