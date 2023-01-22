local config = function()
	local queries = require("nvim-treesitter.query")
	require("nvim-treesitter").define_modules({
		wrapping = {
			attach = function(bufnr, lang)
				-- Do cool stuff here
			end,
			detach = function(bufnr)
				-- Undo cool stuff here
			end,
			is_supported = function(lang)
				return queries.get_query(lang, "wrapping") ~= nil
			end,
		},
	})
	require("nvim-treesitter.configs").setup({
		--indent = {
		--enable = true
		--},
		highlight = {
			enable = true,
			disable = { "c", "rust" },
		},
		auto_install = true,
		playground = {
			enable = true,
			disable = {},
		},
		textobjects = {
			--[[
			select = {
			enable = true,
			lookahead = true,
			keymaps = {
			["<space>n"] = "@function.inner",
			["if"] = "@function.inner",
			["ac"] = "@class.outer",
			["ic"] = "@class.inner",
			},
			},
			]]
			--
			select = {
				enable = true,
				lookahead = false,
				lookbehind = true,
			},
			swap = {
				enable = true,
				swap_next = {
					["<leader>>"] = "@parameter.inner",
				},
				swap_previous = {
					["<space><"] = "@parameter.inner",
				},
			},
			move = {
				enable = true,
				set_jumps = true, -- whether to set jumps in the jumplist
				goto_next_start = {
					["]m"] = "@function.outer",
					["]]"] = "@class.outer",
				},
				goto_next_end = {
					["]M"] = "@function.outer",
					["]["] = "@class.outer",
				},
				goto_previous_start = {
					["[m"] = "@function.outer",
					["[["] = "@class.outer",
				},
				goto_previous_end = {
					["[M"] = "@function.outer",
					["[]"] = "@class.outer",
				},
			},
		},
	})
end

local M = {
	"nvim-treesitter/nvim-treesitter",
	run = ":TSUpdate",
	config = config,
	requires = {
		"nvim-treesitter/nvim-treesitter-textobjects",
	},
	keymaps = {
		{
			"n",
			"<leader>fi",
			function()
				require("nvim-treesitter.textobjects.select").select_textobject("@function.inner", "o")
			end,
			{ noremap = true },
			description = "Select inner function",
		},
		{
			"n",
			"<leader>fa",
			function()
				require("nvim-treesitter.textobjects.select").select_textobject("@function.outer", "o")
			end,
			{ noremap = true },
			description = "Select outer function",
		},
		{
			"n",
			"<leader>ci",
			function()
				require("nvim-treesitter.textobjects.select").select_textobject("@class.inner", "o")
			end,
			{ noremap = true },
			description = "Select inner class",
		},
		{
			"n",
			"<leader>ca",
			function()
				require("nvim-treesitter.textobjects.select").select_textobject("@class.outer", "o")
			end,
			{ noremap = true },
			description = "Select outer class",
		},
		{
			"n",
			"<leader>li",
			function()
				require("nvim-treesitter.textobjects.select").select_textobject("@loop.inner", "o")
			end,
			{ noremap = true },
			description = "Select inner loop",
		},
		{
			"n",
			"<leader>la",
			function()
				require("nvim-treesitter.textobjects.select").select_textobject("@loop.outer", "o")
			end,
			{ noremap = true },
			description = "Select outer loop",
		},
		{
			"n",
			"<leader>pi",
			function()
				require("nvim-treesitter.textobjects.select").select_textobject("@parameter.inner", "o")
			end,
			{ noremap = true },
			description = "Select inner parameter",
		},
		{
			"n",
			"<leader>pa",
			function()
				require("nvim-treesitter.textobjects.select").select_textobject("@parameter.outer", "o")
			end,
			{ noremap = true },
			description = "Select outer parameter",
		},
		{
			"n",
			"<leader>fn",
			function()
				require("nvim-treesitter.textobjects.select").select_textobject("@function.name", "o")
			end,
			{ noremap = true },
			description = "Select the current function name",
		},
	},
}

return M
