local utils = require("config.utils")

local M = {
	packages = {},
}

local lua_rtp = vim.split(package.path, ";")
table.insert(lua_rtp, "lua/?.lua")
table.insert(lua_rtp, "lua/?/init.lua")

_G._config = {
	general = {
		appearance = {
			session_store = "",
		},
	},
	lsp = {
		on_attach = {},
		capabilities = vim.lsp.protocol.make_client_capabilities(),
		blacklist = {}, --{ 'rust_analyzer' },
		initialized_servers = {}, --{ 'rust_analyzer' },
		init_server = nil,
		appearance = {
			signs = {
				error = { sym = "", color = "red" }, --"",
				warning = { sym = "", color = "yellow" },
				hint = { sym = "", color = "blue" },
				information = { sym = "", color = "orange" },
				success = { sym = "", color = "green" },
				fail = { sym = "", color = "red" },
			},
		},
		ls = {
			gopls = {
				settings = {
					gopls = {
						hints = {
							assignVariableTypes = true,
							compositeLiteralFields = true,
							compositeLiteralTypes = true,
							constantValues = true,
							functionTypeParameters = true,
							parameterNames = true,
							rangeVariableTypes = true,
						},
						codelenses = {
							gc_details = true,
							generate = true,
							regenerate_cgo = true,
							tidy = true,
							upgrade_dependency = true,
							vendor = true,
							test = true,
						},
					},
				},
			},
			rust_analyzer = {
				standalone = true,
				settings = {
					["rust-analyzer"] = {
						-- enable clippy on save
						checkOnSave = {
							command = "clippy",
						},
						diagnostics = {
							experimental = {
								enable = true,
							},
						},
						inlayHints = {
							bindingModeHints = {
								enable = true,
							},
						},
						lens = {
							enable = true,
							debug = {
								enable = true,
							},
						},
						completion = {
							callable = {
								snippets = "fill_arguments",
							},
						},
					},
				},
			},
			sumneko_lua = {
				settings = {
					Lua = {
						runtime = {
							version = "LuaJIT",
							path = lua_rtp,
						},
						completion = {
							keywordSnippet = "Replace",
							callSnippet = "Replace",
						},
						hint = {
							enable = true,
						},
						workspace = {
							-- Exclude packages installed by packer
							library = vim.api.nvim_get_runtime_file("!.local/*", true),
						},
						diagnostics = {
							globals = { "vim" },
						},
						format = {
							enable = false,
							-- Put format options here
							--defaultConfig = {
							--indent_style = "space",
							--indent_size = "2",
							--}
						},
					},
				},
			},
		},
	},
	keymaps = {
		{
			"n",
			"<s-l>",
			"<Cmd>bn<cr>",
			{ noremap = true },
			description = "Fast switch to next buffer",
		},
		{
			"n",
			"<s-h>",
			"<Cmd>bp<cr>",
			{ noremap = true },
			description = "Fast switch to prev buffer",
		},
	},
}

local paths = vim.split(vim.fn.glob("~/.config/nvim/lua/config/plugin/**/*lua"), "\n")
--print(vim.inspect(vim.fn.fnamemodify(vim.fn.expand('%:h'), ':p:~:.')))

-- Load all package definitions and detect packages managers
for _, file in pairs(paths) do
	file = file:gsub(".-/%.config/nvim/lua/", "")
	file = file:gsub("%.lua", "")
	if file ~= "config/plugin/init" then
		local pkg = require(file)
		if pkg.keymaps ~= nil then
			vim.list_extend(_G._config.keymaps, pkg.keymaps)
		end
		if pkg.enabled or pkg.enabled == nil then
			if pkg.isPkgMngr then
				--TODO: Look which pkgmgr is configured or select one intelligently
				M.packageMngr = pkg
			else
				table.insert(M.packages, pkg)
			end
		end
	end
end

M.setup = function()
	if M.packageMngr == nil or M.packages == {} then
		return "No packagemanager or packages found!"
	end
	for i, keymap in ipairs(_G._config.keymaps) do
		local rhs = keymap[3]
		if utils.is_fn(rhs) then
			rhs = ":lua _G._config.keymaps[" .. i .. "][3]()<cr>"
		end
		vim.keymap.set(keymap[1], keymap[2], keymap[3], keymap[4])
	end
	M.packageMngr.setup(M.packages)
end

return M
