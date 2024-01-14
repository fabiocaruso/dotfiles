local config = function()
	vim.api.nvim_create_autocmd({ "FileType" }, {
		callback = function(args)
			local bufnr = args.buf
			if vim.bo[bufnr].filetype == "neo-tree" then
				-- TODO: Remove schedule. Something is setting this option after the FileType event
				vim.schedule(function()
					vim.wo.cursorcolumn = false
				end)
			end
		end,
	})
	require("neo-tree").setup({
		close_if_last_window = true,
		window = {
			width = 30,
		},
		filesystem = {
			filtered_items = {
				hide_dotfiles = false,
				hide_gitignored = false,
			},
			follow_current_file = {
				enabled = true,
			},
			use_libuv_file_watcher = true,
		},
		sources = {
			"filesystem",
			-- TODO: Plugin independecy
			--"netman.ui.neo-tree",
		},
	})
	vim.api.nvim_set_hl(0, "NeoTreeGitModified", { bg = "NONE" })
end

local M = {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	requires = {
		"nvim-lua/plenary.nvim",
		"kyazdani42/nvim-web-devicons", -- not strictly required, but recommended
		"MunifTanjim/nui.nvim",
	},
	after = {
		"themer.lua",
	},
	config = config,
}

return M
