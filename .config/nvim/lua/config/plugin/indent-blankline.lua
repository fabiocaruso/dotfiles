local config = function()
	-- TODO: Make this thing generically accessible through _G._config.file_explorer
	vim.g.indent_blankline_bufname_exclude = {
		"neo-tree filesystem .*",
	}
	require("ibl").setup({
		scope = {
			show_start = false,
			show_end = false,
			show_exact_scope = false,
			highlight = { "Keyword" },
			include = {
				node_type = {
					rust = { "call_expression" },
					lua = { "return_statement", "table_constructor" }
				},
			},
		},
	})
end

local M = {
	"lukas-reineke/indent-blankline.nvim",
	config = config,
}

return M
