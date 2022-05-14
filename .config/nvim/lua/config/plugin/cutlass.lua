local config = function()
	require('cutlass').setup({})
end

local M = {
	'gbprod/cutlass.nvim',
	config = config,
}

return M
