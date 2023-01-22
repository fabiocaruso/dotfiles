local config = function()
	require('notify').setup()
	vim.notify = require('notify')
end

local M = {
	'rcarriga/nvim-notify',
	config = config,
};

return M;
