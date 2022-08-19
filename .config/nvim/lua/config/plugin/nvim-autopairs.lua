local config = function()
	require('nvim-autopairs').setup({
		check_ts = true,
	})
end

local M = {
	'windwp/nvim-autopairs',
	config = config,
};

return M;
