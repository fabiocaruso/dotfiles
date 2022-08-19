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
			function()
				local ok, lsp_lines = pcall(require, "lsp_lines")
				if ok then
					lsp_lines.toggle()
				end
			end,
			{ noremap = true },
			description = "Toggle lsp_lines",
		},
	},
};

return M;
