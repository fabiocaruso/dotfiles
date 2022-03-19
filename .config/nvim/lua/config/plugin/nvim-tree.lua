local config = function()
	require('nvim-tree').setup({
		open_on_setup = true,
		hijack_unnamed_buffer_when_opening = true,
		auto_close = true,
		open_on_tab = true,
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
