-- Note: needs 'rustup component add rustfmt'

local config = function()
	local gc = _G._config
	local lspf = require('lsp-format')
	lspf.setup()
	table.insert(gc.lsp.on_attach, lspf.on_attach)
end

local M = {
	'lukas-reineke/lsp-format.nvim',
	config = config,
}

return M
