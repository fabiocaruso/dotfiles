return {
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
		]]--
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

