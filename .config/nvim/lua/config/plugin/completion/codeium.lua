local config = function()
	require("codeium").setup({})
end

local M = {
	"jcdickinson/codeium.nvim",
	requires = {
		"nvim-lua/plenary.nvim",
		"hrsh7th/nvim-cmp",
	},
	config = config,
}

return M
