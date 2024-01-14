local config = function()
	require("codelens_test").setup()
end

local M = {
	'~/projects/nvim/codelens_test.nvim',
	config = config,
};

return M;
