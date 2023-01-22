local config = function()
	require('live-command').setup({
		commands = {
			Norm = { cmd = "norm" },
			D = { cmd = "d" },
		},
	})
end

local M = {
	'smjonas/live-command.nvim',
	config = config,
}

return M
