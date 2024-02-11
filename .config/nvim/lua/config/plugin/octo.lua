local config = function()
	require("octo").setup({
suppress_missing_scope = {
    projects_v2 = true,
  }
	})
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
