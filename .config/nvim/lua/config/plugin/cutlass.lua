local config = function()
	require('cutlass').setup({
		cut_key = 'x',
		{ "n<S-x>" },
	})
end

local M = {
	'gbprod/cutlass.nvim',
	enabled = false,
	config = config,
}

return M
