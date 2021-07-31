set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath=&runtimepath
source ~/.vimrc

lua << EOF
require("nvim-treesitter.configs").setup {
	playground = {
		enable = true,
		disable = {},
	},
	textobjects = {
    select = {
      enable = true,
      lookahead = true,
      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ["<leader>n"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner",

        -- Or you can define your own textobjects like this
        ["-"] = {
          python = "(function_definition) @function",
          cpp = "(function_definition) @function",
          c = "(function_definition) @function",
          rust = "(function_item (identifier)) @function",
        },
      },
    },
		swap = {
      enable = true,
      swap_next = {
        ["<space>q"] = "@parameter.inner",
      },
      swap_previous = {
        ["<space>w"] = "@parameter.inner",
      },
    },
  },
}
EOF
