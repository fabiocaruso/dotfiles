local setup = function()
	require('config.keymaps')
	require('config.plugin').setup()
end

local M = {
	setup = setup,
};

return M;
