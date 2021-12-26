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

"nvim-treesitter textobjects select
nnoremap <leader>fi <Cmd>lua require'nvim-treesitter.textobjects.select'.select_textobject('@function.inner', 'o')<CR>
nnoremap <leader>fa <Cmd>lua require'nvim-treesitter.textobjects.select'.select_textobject('@function.outer', 'o')<CR>
nnoremap <leader>ci <Cmd>lua require'nvim-treesitter.textobjects.select'.select_textobject('@class.inner', 'o')<CR>
nnoremap <leader>ca <Cmd>lua require'nvim-treesitter.textobjects.select'.select_textobject('@class.outer', 'o')<CR>
nnoremap <leader>li <Cmd>lua require'nvim-treesitter.textobjects.select'.select_textobject('@loop.inner', 'o')<CR>
nnoremap <leader>la <Cmd>lua require'nvim-treesitter.textobjects.select'.select_textobject('@loop.outer', 'o')<CR>
nnoremap <leader>pi <Cmd>lua require'nvim-treesitter.textobjects.select'.select_textobject('@parameter.inner', 'o')<CR>
nnoremap <leader>pa <Cmd>lua require'nvim-treesitter.textobjects.select'.select_textobject('@parameter.outer', 'o')<CR>
nnoremap <leader>fn <Cmd>lua require'nvim-treesitter.textobjects.select'.select_textobject('@function.name', 'o')<CR>

lua << EOF
require("nvim-treesitter.configs").setup {
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
