-- nvim-treesitter textobjects select
vim.api.nvim_set_keymap("n", "<leader>fi",
	"<Cmd>lua require'nvim-treesitter.textobjects.select'.select_textobject('@function.inner', 'o')<cr>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>fa",
	":lua require'nvim-treesitter.textobjects.select'.select_textobject('@function.outer', 'o')<cr>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>ci",
	":lua require'nvim-treesitter.textobjects.select'.select_textobject('@class.inner', 'o')<cr>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>ca",
	":lua require'nvim-treesitter.textobjects.select'.select_textobject('@class.outer', 'o')<cr>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>li",
	":lua require'nvim-treesitter.textobjects.select'.select_textobject('@loop.inner', 'o')<cr>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>la",
	":lua require'nvim-treesitter.textobjects.select'.select_textobject('@loop.outer', 'o')<cr>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>pi",
	":lua require'nvim-treesitter.textobjects.select'.select_textobject('@parameter.inner', 'o')<cr>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>pa",
	":lua require'nvim-treesitter.textobjects.select'.select_textobject('@parameter.outer', 'o')<cr>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>fn",
	"<Cmd>lua require'nvim-treesitter.textobjects.select'.select_textobject('@function.name', 'o')<cr>", { noremap = true })
