local config = function()
	require('trouble').setup({
		auto_open = true,
		auto_close = true,
		padding = false,
		action_keys = {
			hover = "h",
		},
	})
end

local M = {
	'folke/trouble.nvim',
	config = config,
};

return M;
