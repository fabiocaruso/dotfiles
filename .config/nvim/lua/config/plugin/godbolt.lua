local config = function()
	require("godbolt").setup({})
end

local M = {
	'p00f/godbolt.nvim',
	config = config,
	keymaps = {
		{
			'n',
			'<leader>gb',
			'<Cmd>GodboltCompiler telescope<cr>',
			{ noremap = true },
			description = 'Show asm of selection',
		},
	},
}

return M
