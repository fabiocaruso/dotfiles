local config = function()
	local queries = require("nvim-treesitter.query")
	require('nvim-treesitter').define_modules {
		wrapping = {
			attach = function(bufnr, lang)
				-- Do cool stuff here
			end,
			detach = function(bufnr)
				-- Undo cool stuff here
			end,
			is_supported = function(lang)
				return queries.get_query(lang, 'wrapping') ~= nil
			end
		}
	}
	require('nvim-treesitter.configs').setup {
		--[[indent = {
		enable = true
		},]]
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
			]] --
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
	}
end

local M = {
	'nvim-treesitter/nvim-treesitter',
	run = ':TSUpdate',
	config = config,
	requires = {
		'nvim-treesitter/nvim-treesitter-textobjects',
	}
};

return M;
