local config = function()
	require('boole').setup({
		mappings = {
			increment = '<C-a>',
			decrement = '<C-x>'
		},
	})
end

local M = {
	'nat-418/boole.nvim',
	config = config,
}

return M
