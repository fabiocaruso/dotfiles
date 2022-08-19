local config = function()
	require('cutlass').setup({
		cut_key = 'x',
		{ "n<S-x>" },
	})
end

local M = {
	'gbprod/cutlass.nvim',
	config = config,
}

return M
