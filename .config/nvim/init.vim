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
-- For plugin development
-- Add current root directory to the runtimepath
print(vim.api.nvim_command [[
autocmd VimEnter * let &rtp.=','.FindRootDirectory()
]])


local config = require('config')
-- Utils
local utils = require('utils')
require('nvim-web-devicons').setup({})
require('codicons').setup({})
require('gitsigns').setup({})
require('litee.lib').setup({
	tree = {
		icons = require('litee.lib.icons').nerd,
		icon_set = "nerd",
	},
	panel = {
		orientation = "right",
	},
})
require('litee.symboltree').setup({
	on_open = "panel",
	icon_set = "nerd",
})
require('litee.calltree').setup({
	on_open = "panel",
	icon_set = "nerd",
})

-- Tree-sitter
require("nvim-treesitter.configs").setup(config.tree_sitter) 
-- Telescope
require('telescope').setup(config.telescope)
require('telescope').load_extension('fzy_native')
require("telescope").load_extension('ui-select')

if vim.g.native_lsp == 1 then
-- Icons
--local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
local signs = { Error = " ", Warn = "⚠️ ", Hint = " ", Info = "ℹ️ " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end
vim.diagnostic.config({
  --[[virtual_text = {
    prefix = '●', -- Could be '■', '▎', 'x'
  }]]--
	virtual_text = false,
	signs = true,
	underline = true,
	float = { border = "none" },
})
vim.o.updatetime = 250
vim.cmd [[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false, scope="cursor"})]]

-- Lsp Signature
require('lsp_signature').setup({
	bind = true, -- This is mandatory, otherwise border config won't get registered.
  handler_opts = {
    border = "none"
  }
})
require('dapui').setup({})
local dap, dapui = require("dap"), require("dapui")
dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end
require('crates').setup({})
require("trouble").setup({
	auto_open = true,
	auto_close = true,
})
require('nvim-tree').setup({
	open_on_setup = true,
	auto_close = true,
  open_on_tab = true,
	update_to_buf_dir   = {
    enable = false,
    auto_open = true,
  },
	diagnostics = {
		enable = true,
	},
	filters = {
    dotfiles = false,
	},
	git = {
    ignore = false,
  },
	view = {
		auto_resize = true,
	}
})

-- Nvim-cmp Autocompletion
local cmp = require('cmp')
local lspkind = require('lspkind')
local luasnip = require('luasnip')
require('luasnip.loaders.from_vscode').lazy_load()
local confirm_behavior = {
	behavior = cmp.ConfirmBehavior.Replace,
	select = true,
}
cmp.setup({
	snippet = {
		-- REQUIRED - you must specify a snippet engine
		expand = function(args)
			-- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
			luasnip.lsp_expand(args.body) -- For `luasnip` users.
			-- require('snippy').expand_snippet(args.body) -- For `snippy` users.
			-- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
		end,
	},
	mapping = {
		['<C-j>'] = cmp.mapping.select_next_item(),
		['<C-k>'] = cmp.mapping.select_prev_item(),
		['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
		--[[['<C-e>'] = cmp.mapping({
			i = cmp.mapping.abort(),
			c = cmp.mapping.close(),
		}),]]--
		--[[['<S-Tab>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
		['<Tab>'] = cmp.mapping.confirm({
			behavior = cmp.ConfirmBehavior.Replace,
			select = true,
		}),]]-- -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
		['<S-Tab>'] = cmp.mapping(function(fallback)
			if luasnip.jumpable(-1) then
				luasnip.jump(-1)
			elseif cmp.visible() == false then
				cmp.complete()
			else
				fallback()
			end
		end, { 'i', 'c' }),
		['<Tab>'] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.confirm(confirm_behavior)
			elseif luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			else
				fallback()
			end
		end, { 'i', 'c'}), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
		['<CR>'] = cmp.mapping.confirm(confirm_behavior),
	},
	sources = cmp.config.sources({
		{ name = 'nvim_lsp' },
		-- { name = 'vsnip' }, -- For vsnip users.
		{ name = 'luasnip' }, -- For luasnip users.
		-- { name = 'ultisnips' }, -- For ultisnips users.
		-- { name = 'snippy' }, -- For snippy users.
		{ name = 'crates' },
	}, {
		{ name = 'buffer' },
	}),
	formatting = {
    format = lspkind.cmp_format({
			with_text = true,
			menu = ({
				buffer = "[Buffer]",
				nvim_lsp = "[LSP]",
				luasnip = "[LuaSnip]",
				crates = "[Crates]",
				cmdline = "[CmdLine]",
				--nvim_lua = "[Lua]",
			})
		}),
  },
})
-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
	sources = {
		{ name = 'buffer' }
	},
})
-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
	sources = cmp.config.sources({
		{ name = 'path' }
	}, {
		{ name = 'cmdline' }
	}),
})
-- NOTE: If something with the lsp statusbar is broken it is likely due to the fact that i dont set
-- capabilities for lsp_status properly. So change the Argument of update_capabilities to lsp_status.capabilities.
-- Or maybe call it twice.
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

-- Status in Lualine
local lsp_status = require('lsp-status')
lsp_status.register_progress()
lsp_status.config({
	current_function = false,
	show_filename = false,
	diagnostics = false,
})

-- Rust Tools
-- TODO: Automatically download codelldb and put it in the corresponding folder
local extension_path = '/home/fabiocaruso/.vscode/extensions/vadimcn.vscode-lldb-1.6.10/'
local codelldb_path = extension_path .. 'adapter/codelldb'
local liblldb_path = extension_path .. 'lldb/lib/liblldb.so'
vim.fn.sign_define('DapBreakpoint', {text='', texthl='red', linehl='', numhl=''})
vim.fn.sign_define('DapBreakpointCondition', {text='ᶜ', texthl='red', linehl='', numhl=''})
vim.fn.sign_define('DapLogPoint', {text='ᶫ', texthl='red', linehl='', numhl=''})
vim.fn.sign_define('DapBreakpointRejected', {text='', texthl='red', linehl='', numhl=''})
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
		capabilities = capabilities,
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

vim.lsp.handlers["textDocument/definition"] = utils.goto_definition('vsplit')
vim.lsp.handlers["textDocument/implementation"] = utils.goto_definition('vsplit')
vim.lsp.handlers["textDocument/references"] = require('nice-reference').reference_handler

-- lsp-installer
local lsp_installer = require("nvim-lsp-installer")
lsp_installer.on_server_ready(function(server)
    local opts = {}

    -- (optional) Customize the options passed to the server
    -- if server.name == "tsserver" then
    --     opts.root_dir = function() ... end
    -- end

    server:setup(opts)
end)
end

require('lualine').setup({
	sections = {
		lualine_b = {
			'branch',
			'diff',
			{
				'diagnostics',
				symbols = {error = ' ', warn = '⚠️ ', info = 'ℹ️ ', hint = ' '},
			}
		},
		lualine_c = { 'filename', 'g:coc_status', 'require("lsp-status").status()' },
		lualine_z = { function() return vim.fn.ObsessionStatus('S', 'X') end, 'location' },
	}
})
require('tabby').setup()
EOF
