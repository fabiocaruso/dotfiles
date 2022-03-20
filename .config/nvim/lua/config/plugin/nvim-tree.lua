local config = function()
	require('nvim-tree').setup({
		open_on_setup = true,
		auto_close = true,
		open_on_tab = true,
		update_to_buf_dir   = {
			enable = false,
			auto_open = true,
		},
		diagnostics = {
			enable = true,
		},
		filters = {
			dotfiles = false,
		},
		git = {
			ignore = false,
		},
		view = {
			auto_resize = true,
		}
	})
end

local M = {
	'kyazdani42/nvim-tree.lua',
	config = config,
}

return M
