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
	-- TODO: Change back if https://github.com/folke/todo-comments.nvim/commit/1814feca54540497de99d474dd6c9de6b691cf01#commitcomment-88137994 gets fixed
	commit = '3fe59db6dd6fb07857e0b9670a3b711104dfb53a',
	requires = 'nvim-lua/plenary.nvim',
	config = config,
};

return M;
