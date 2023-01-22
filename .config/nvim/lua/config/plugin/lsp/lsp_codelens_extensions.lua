local config = function()
	require("codelens_extensions").setup()
end

local M = {
	'ericpubu/lsp_codelens_extensions.nvim',
	requires = {
		{ "nvim-lua/plenary.nvim" },
		{ "mfussenegger/nvim-dap" }
	},
	config = config,
};

return M;
