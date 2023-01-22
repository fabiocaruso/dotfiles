local config = function()
	require('ccc').setup({
		highlighter = {
			---@type boolean
			auto_enable = true,
		},
		win_opts = {
			border = "none",
		},
	})
end

local M = {
	'uga-rosa/ccc.nvim',
	config = config,
	keymaps = {
		{
			'n',
			'<leader>cp',
			'<Cmd>CccPick<cr>',
			{ noremap = true },
			description = "Color picker",
		},
	},
}

return M
