local config = function()
	require("diffview").setup({})
end

local M = {
	"sindrets/diffview.nvim",
	requires = {
		"nvim-tree/nvim-web-devicons",
	},
	config = config,
}

return M
