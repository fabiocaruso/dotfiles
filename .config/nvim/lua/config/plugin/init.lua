local M = {
	packages = {}
}

_G._config = {
	lsp = {
		on_attach = {},
		capabilities = vim.lsp.protocol.make_client_capabilities(),
	},
}

local paths = vim.split(vim.fn.glob('~/.config/nvim/lua/config/plugin/**/*lua'), '\n')
--print(vim.inspect(vim.fn.fnamemodify(vim.fn.expand('%:h'), ':p:~:.')))

for i, file in pairs(paths) do
	file = file:gsub('.-/%.config/nvim/lua/', '')
	file = file:gsub('%.lua', '')
	if file ~= 'config/plugin/init' then
		local pkg = require(file)
		if pkg.isPkgMngr then
			--TODO: Look which pkgmgr is configured or select one intelligently
			M.packageMngr = pkg
		else
			table.insert(M.packages, pkg)
		end
	end
end

M.setup = function()
	if M.packageMngr == nil or M.packages == {} then
		return "No packagemanager or packages found!"
	end
	M.packageMngr.setup(M.packages)
end

return M
