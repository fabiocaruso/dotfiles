local config = function()
	require("neogen").setup({ snippet_engine = "luasnip" })
end

local M = {
	"danymat/neogen",
	requires = { "nvim-treesitter/nvim-treesitter" },
	config = config,
	keymaps = {
		{
			"n",
			"<leader>ga",
			"<Cmd>Neogen<cr>",
			{ noremap = true },
			description = "Generate annotation for block under cursor",
		},
	},
}

return M
