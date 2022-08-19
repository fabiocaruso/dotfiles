local config = function()
	vim.fn.sign_define("DiagnosticSignError",
		{text = " ", texthl = "DiagnosticSignError"})
	vim.fn.sign_define("DiagnosticSignWarn",
		{text = " ", texthl = "DiagnosticSignWarn"})
	vim.fn.sign_define("DiagnosticSignInfo",
		{text = " ", texthl = "DiagnosticSignInfo"})
	vim.fn.sign_define("DiagnosticSignHint",
		{text = "", texthl = "DiagnosticSignHint"})
	require('neo-tree').setup({
		close_if_last_window = true,
		window = {
			width = 30,
		},
		filesystem = {
			filtered_items = {
				hide_dotfiles = false,
				hide_gitignored = false,
			},
			follow_current_file = true,
			use_libuv_file_watcher = true,
		},
	})
end

local M = {
	'nvim-neo-tree/neo-tree.nvim',
	branch = "v2.x",
	requires = {
		"nvim-lua/plenary.nvim",
		"kyazdani42/nvim-web-devicons", -- not strictly required, but recommended
		"MunifTanjim/nui.nvim",
	},
	config = config,
}

return M
