set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath=&runtimepath
source ~/.vimrc

"Keymappings
nnoremap ; :lua require'telescope.builtin'.find_files{}<cr>
nnoremap , :lua require'telescope.builtin'.live_grep{ vimgrep_arguments = {'ag', '-i', '--vimgrep', '--noheading', '--hidden', '--smart-case'} }<cr>
nnoremap <Leader>fb :lua require'telescope.builtin'.buffers{}<cr>
nnoremap <Leader>fgb :lua require'telescope.builtin'.git_branches{}<cr>
nnoremap <Leader>fgc :lua require'telescope.builtin'.git_commits{}<cr>
nnoremap <Leader>fgs :lua require'telescope.builtin'.git_status{}<cr>

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

lua << EOF
local actions = require('telescope.actions')
require('telescope').setup {
	defaults = {
		color_devicons = true,
		file_sorter = require('telescope.sorters').get_fzy_sorter,
		file_previewer = require('telescope.previewers').vim_buffer_cat.new,
		mappings = {
			i = {
				["<C-n>"] = false,
				["<C-p>"] = false,
				["<C-k>"] = actions.move_selection_previous,
				["<C-j>"] = actions.move_selection_next,
			}
		}
	},
	extensions = {
		fzy_native = {
			override_generic_sorter = false,
			override_file_sorter = true,
		}
	}
}
require('telescope').load_extension('fzy_native')
EOF
