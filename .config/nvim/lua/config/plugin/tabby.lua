local config = function()
	require('tabby').setup({})
end

local M = {
	'nanozuki/tabby.nvim',
	config = config,
	enabled = false,
}

return M
