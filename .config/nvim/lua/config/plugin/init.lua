local utils = require('config.utils');

local M = {
	packages = {}
}

local lua_rtp = vim.split(package.path, ';')
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
		blacklist = { 'rust_analyzer' },
		initialized_servers = { 'rust_analyzer' },
		init_server = nil,
		appearance = {
			signs = {
				error = "",
				warning = "",
				hint = "",
				information = "",
				success = ""
			},
		},
		ls = {
			sumneko_lua = {
				settings = {
					Lua = {
						runtime = {
							version = 'LuaJIT',
							path = lua_rtp,
						},
						workspace = {
							-- Exclude packages installed by packer
							library = vim.api.nvim_get_runtime_file("!.local/*", true),
						},
						diagnostics = {
							globals = { 'vim' },
						},
					},
				},
			},
		},
	},
	keymaps = {
		{
			'n',
			'<s-l>',
			'<Cmd>bn<cr>',
			{ noremap = true },
			description = "Fast switch to next buffer",
		},
		{
			'n',
			'<s-h>',
			'<Cmd>bp<cr>',
			{ noremap = true },
			description = "Fast switch to prev buffer",
		},
		{
			'n',
			'<s-x>',
			'<Cmd>bd<cr>',
			{ noremap = true },
			description = "Fast delete buffer",
		},
	},
}

local paths = vim.split(vim.fn.glob('~/.config/nvim/lua/config/plugin/**/*lua'), '\n')
--print(vim.inspect(vim.fn.fnamemodify(vim.fn.expand('%:h'), ':p:~:.')))

-- Load all package definitions and detect packages managers
for _, file in pairs(paths) do
	file = file:gsub('.-/%.config/nvim/lua/', '')
	file = file:gsub('%.lua', '')
	if file ~= 'config/plugin/init' then
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
		vim.api.nvim_set_keymap(keymap[1], keymap[2], rhs, keymap[4])
	end
	M.packageMngr.setup(M.packages)
end

return M
