local config = function()
	require("lsp_lines").setup()
	vim.diagnostic.config({ virtual_lines = false })
end

local M = {
	'https://git.sr.ht/~whynothugo/lsp_lines.nvim',
	config = config,
	keymaps = {
		{
			'n',
			'<leader>l',
			require("lsp_lines").toggle,
			{ noremap = true },
			description = "Toggle lsp_lines",
		},
	},
};

return M;
