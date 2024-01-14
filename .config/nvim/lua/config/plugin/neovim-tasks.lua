local config = function()
	require("tasks").setup({})
end

local M = {
	"Shatur/neovim-tasks",
	requires = {
		{ "nvim-lua/plenary.nvim" },
		{ "mfussenegger/nvim-dap" },
	},
	config = config,
	keymaps = {},
}

return M
