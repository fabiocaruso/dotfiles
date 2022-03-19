local M = {
	'saecki/crates.nvim',
	tag = 'v0.1.0',
	requires = { 'nvim-lua/plenary.nvim' },
	config = function()
		require('crates').setup()
	end,
};

return M;
