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
require('nvim-web-devicons').setup({})
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
		},
		["ui-select"] = {
      require("telescope.themes").get_dropdown {
        -- even more opts
      }
    }
	}
}
require('telescope').load_extension('fzy_native')
require("telescope").load_extension("ui-select")
EOF

" Native LSP
if g:native_lsp == 1
lua << EOF
-- Icons
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end
vim.diagnostic.config({
  virtual_text = {
    prefix = '●', -- Could be '■', '▎', 'x'
  }
})
-- Go to definition in split window
local function goto_definition(split_cmd)
  local util = vim.lsp.util
  local log = require("vim.lsp.log")
  local api = vim.api

  -- note, this handler style is for neovim 0.5.1/0.6, if on 0.5, call with function(_, method, result)
  local handler = function(_, result, ctx)
    if result == nil or vim.tbl_isempty(result) then
      local _ = log.info() and log.info(ctx.method, "No location found")
      return nil
    end

    if split_cmd then
      vim.cmd(split_cmd)
    end

    if vim.tbl_islist(result) then
      util.jump_to_location(result[1])

      if #result > 1 then
        util.set_qflist(util.locations_to_items(result))
        api.nvim_command("copen")
        api.nvim_command("wincmd p")
      end
    else
      util.jump_to_location(result)
    end
  end

  return handler
end
vim.lsp.handlers["textDocument/definition"] = goto_definition('vsplit')
vim.lsp.handlers["textDocument/implementation"] = goto_definition('vsplit')
-- Status in Lualine
local lsp_status = require('lsp-status')
lsp_status.register_progress()
lsp_status.config({
	current_function = false,
	show_filename = false,
	diagnostics = false,
})
-- Lsp Signature
require('lsp_signature').setup({
	bind = true, -- This is mandatory, otherwise border config won't get registered.
  handler_opts = {
    border = "none"
  }
})
-- Rust Tools
local extension_path = '/home/fabiocaruso/.vscode/extensions/vadimcn.vscode-lldb-1.6.10/'
local codelldb_path = extension_path .. 'adapter/codelldb'
local liblldb_path = extension_path .. 'lldb/lib/liblldb.so'
require('dapui').setup({})
require('rust-tools').setup({
	tools = { -- rust-tools options
		autoSetHints = true,
		hover_with_actions = true,
		hover_actions = {
			auto_focus = true,
		},
	},
	server = {
		on_attach = lsp_status.on_attach,
		capabilities = lsp_status.capabilities,
		settings = {
			["rust-analyzer"] = {
				-- enable clippy on save
				checkOnSave = {
					command = "clippy"
				},
			}
		}
	},
	dap = {
		adapter = require('rust-tools.dap').get_codelldb_adapter(codelldb_path, liblldb_path),
		configurations = {
			rust = {
				{
					name = "Launch",
					type = "lldb",
					request = "launch",
					program = function()
						return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
					end,
					cwd = '${workspaceFolder}',
					stopOnEntry = false,
					args = {},
				},
			},
		},
	},
})
require('litee').setup({})
require('crates').setup({})
require("trouble").setup({
	auto_open = true,
	auto_close = true,
})
EOF

lua << EOF
require('nvim-tree').setup({
	open_on_setup = true,
	auto_close = true,
  open_on_tab = true,
	diagnostics = {
		enable = true,
	},
	filters = {
    dotfiles = true,
	},
	view = {
		auto_resize = true,
	}
})
EOF

lua << EOF
local cmp = require('cmp')
local lspkind = require('lspkind')

cmp.setup({
	snippet = {
		-- REQUIRED - you must specify a snippet engine
		expand = function(args)
			-- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
			-- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
			-- require('snippy').expand_snippet(args.body) -- For `snippy` users.
			vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
		end,
	},
	mapping = {
		['<C-j>'] = cmp.mapping.select_next_item(),
		['<C-k>'] = cmp.mapping.select_prev_item(),
		['<S-Tab>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
		--['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
		--[[['<C-e>'] = cmp.mapping({
			i = cmp.mapping.abort(),
			c = cmp.mapping.close(),
		}),]]--
		['<Tab>'] = cmp.mapping.confirm({
			behavior = cmp.ConfirmBehavior.Replace,
			select = true,
		}), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
	},
	sources = cmp.config.sources({
		{ name = 'nvim_lsp' },
		-- { name = 'vsnip' }, -- For vsnip users.
		-- { name = 'luasnip' }, -- For luasnip users.
		{ name = 'ultisnips' }, -- For ultisnips users.
		-- { name = 'snippy' }, -- For snippy users.
		{ name = "crates" },
	}, {
		{ name = 'buffer' },
	}),
	formatting = {
    format = lspkind.cmp_format(),
  },
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
	sources = {
		{ name = 'buffer' }
	}
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
	sources = cmp.config.sources({
		{ name = 'path' }
	}, {
		{ name = 'cmdline' }
	})
})
EOF

lua << EOF
vim.lsp.handlers["textDocument/references"] = require 'nice-reference'.reference_handler
EOF
endif

lua << EOF
require('lualine').setup ({
	sections = {
		lualine_b = {
			'branch',
			'diff',
			{
				'diagnostics',
				symbols = {error = ' ', warn = ' ', info = ' ', hint = ' '},
			}
		},
		lualine_c = { 'filename', 'g:coc_status', 'require("lsp-status").status()' },
		lualine_z = { function() return vim.fn.ObsessionStatus('S', 'X') end, 'location' },
	}
})
require('bufferline').setup({
	diagnostics = "nvim_lsp",
	diagnostics_update_in_insert = true,
	diagnostics_indicator = function(count, level, diagnostics_dict, context)
		local s = " "
		for e, n in pairs(diagnostics_dict) do
			local sym = e == "error" and " "
				or (e == "warning" and " " or "" )
			s = s .. n .. sym
		end
		return s
	end
})
EOF
