local config = function()
	require('nvim-tree').setup({
		hijack_unnamed_buffer_when_opening = true,
		open_on_setup = true,
		auto_close = true,
		auto_reload_on_write = true,
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
			mappings = {
			}
		},
		actions = {
			open_file = {
				resize_window = true,
			},
		}
	})
end

local M = {
	'kyazdani42/nvim-tree.lua',
	config = config,
}

return M
