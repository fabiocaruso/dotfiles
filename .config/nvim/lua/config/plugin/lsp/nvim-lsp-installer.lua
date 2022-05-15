local config = function()
	local gc = _G._config
	local utils = require('config.utils')
	local lsp_installer = require("nvim-lsp-installer")
	lsp_installer.setup({
		automatic_installation = false,
	})
	local installed_servers = lsp_installer.get_installed_servers()
	vim.api.nvim_create_autocmd({"BufRead"}, {
		callback = function()
			-- TODO: Exclude certain filetypes from showing the context menu
			local available_servers = lsp_installer.get_available_servers()
			local ft_servers = {}
			local installed_ft_servers = {}
			for _, server in ipairs(available_servers) do
				local supports_filetype = utils.in_list(server:get_supported_filetypes(), vim.bo.filetype)
				local is_installed = utils.in_list(installed_servers, server)
				if supports_filetype then
					if is_installed then
						table.insert(installed_ft_servers, server)
					else
						table.insert(ft_servers, server)
					end
				end
			end
			if #installed_ft_servers < 1 then
				vim.ui.select(ft_servers, {
					prompt = 'Choose a ls for filetype '..vim.bo.filetype,
					format_item = function(server) return server.name end
				}, function(server, _)
					server:install()
					gc.lsp.init_server(server.name)
				end)
			end
		end,
	})
	vim.api.nvim_create_autocmd({"BufEnter"}, {
		callback = function()
			local blacklisted_servers = gc.lsp.blacklist
			for _, server in ipairs(installed_servers) do
				local is_blacklisted = utils.in_list(blacklisted_servers, server.name)
				local is_initialized = utils.in_list(gc.lsp.initialized_servers, server.name)
				if not is_blacklisted and not is_initialized then
					gc.lsp.init_server(server.name)
					table.insert(gc.lsp.initialized_servers, server.name)
				end
			end
		end,
	})
end

local M = {
	'williamboman/nvim-lsp-installer',
	config = config,
	after = {'nvim-lspconfig'},
};

return M;
