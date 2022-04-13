-- FIXME: Does not work rn

local config = function()
	require('regexplainer').setup()
end

local M = {
	'bennypowers/nvim-regexplainer',
	requires = {
		'nvim-treesitter/nvim-treesitter',
		'MunifTanjim/nui.nvim',
	},
	config = config,
}

return M
