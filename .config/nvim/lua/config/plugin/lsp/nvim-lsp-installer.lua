local config = function()
	local gc = _G._config
	local utils = require('config.utils')
	local lsp_installer = require("nvim-lsp-installer")
	--lsp_installer.setup({})
	lsp_installer.on_server_ready(function(server)
		local opts = {}

		opts.on_attach = utils.merge_fns(gc.lsp.on_attach)
		opts.capabilities = gc.lsp.capabilities
		local ls_config = gc.lsp.ls[server.name]
		if ls_config ~= nil then
			opts = vim.tbl_deep_extend("keep", opts, ls_config)
		end

		-- TODO: Make this dynamic
		if server.name == 'rust_analyzer' then
			return
		end

		-- (optional) Customize the options passed to the server
		-- if server.name == "tsserver" then
		--     opts.root_dir = function() ... end
		-- end

		-- This setup() function will take the provided server configuration and decorate it with the necessary properties
		-- before passing it onwards to lspconfig.
		-- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
		server:setup(opts)
	end)
end

local M = {
	'williamboman/nvim-lsp-installer',
	config = config,
};

return M;
