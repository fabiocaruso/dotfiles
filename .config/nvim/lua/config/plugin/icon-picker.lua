local config = function()
	require("icon-picker").setup({
		disable_legacy_commands = true
	})
end

local M = {
	'ziontee113/icon-picker.nvim',
	config = config,
	keymaps = {
		{
			'n',
			'<leader>ip',
			'<Cmd>IconPickerYank alt_font symbols nerd_font emoji<cr>',
			{ noremap = true },
			description = "Icon picker yank",
		},
	},
}

return M
