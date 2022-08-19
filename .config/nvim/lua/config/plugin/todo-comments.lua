local config = function()
	require("todo-comments").setup({
		search = {
			command = "rg",
			args = {
				"--color=never",
				"--no-heading",
				"--with-filename",
				"--line-number",
				"--column",
				"--glob=!node_modules",
				"--glob=!assets",
			},
			pattern = [[\b(KEYWORDS):]],
		},
	})
end

local M = {
	'folke/todo-comments.nvim',
	requires = 'nvim-lua/plenary.nvim',
	config = config,
};

return M;
