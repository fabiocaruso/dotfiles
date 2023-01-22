local config = function()
	require("octo").setup()
end

local M = {
	'pwntester/octo.nvim',
	config = config,
	requires = {
		{ 'nvim-lua/plenary.nvim' },
		{ 'nvim-telescope/telescope.nvim' },
		{ 'kyazdani42/nvim-web-devicons' },
	},
};

return M;
