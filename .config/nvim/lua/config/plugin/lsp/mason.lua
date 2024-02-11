local config = function()
	local gc = _G._config
	local utils = require("config.utils")
	local mason = require("mason")
	local mason_lspconfig = require("mason-lspconfig")
	local mason_mapping_filetype = require("mason-lspconfig.mappings.filetype")
	local mason_mapping_server = require("mason-lspconfig.mappings.server")
	local mason_registry = require("mason-registry")
	mason.setup()
	mason_lspconfig.setup()
	vim.api.nvim_create_autocmd({ "BufRead" }, {
		callback = function()
			-- TODO: Exclude certain filetypes from showing the context menu
			--local available_servers = utils.filter_table(
			--mason_registry.get_all_packages(),
			--function(x)
			--return utils.in_list(x.spec.categories, "LSP")
			--end
			--)
			--print(vim.inspect(available_servers))
			local ft_servers = mason_mapping_filetype[vim.bo.filetype]
			if ft_servers == nil then
				return
			end
			local installed_ft_servers = 0
			for _, v in ipairs(ft_servers) do
				local package_name = mason_mapping_server.lspconfig_to_package[v]
				if mason_registry.is_installed(package_name) then
					installed_ft_servers = installed_ft_servers + 1
				end
			end
			if installed_ft_servers < 1 then
				vim.ui.select(ft_servers, {
					prompt = "Choose a ls for filetype " .. vim.bo.filetype,
					format_item = function(server)
						return server
					end,
				}, function(server, _)
					if server == nil then
						return
					end
					local package_name = mason_mapping_server.lspconfig_to_package[server]
					mason_registry.get_package(package_name):install()
					mason_registry:on("package:install:success", function(pkg)
						vim.schedule(function()
							gc.lsp.init_server(server)
							-- TODO: Find out why lspconfig doesn't start the lsp automatically, even if opts.autostart is true by default
							vim.cmd("LspStart")
						end)
					end)
				end)
			end
		end,
	})
	local installed_servers = mason_lspconfig.get_installed_servers()
	vim.api.nvim_create_autocmd({ "BufEnter" }, {
		callback = function()
			local blacklisted_servers = gc.lsp.blacklist
			for _, server in ipairs(installed_servers) do
				local is_blacklisted = utils.in_list(blacklisted_servers, server)
				local is_initialized = utils.in_list(gc.lsp.initialized_servers, server)
				if not is_blacklisted and not is_initialized then
					gc.lsp.init_server(server)
					table.insert(gc.lsp.initialized_servers, server)
				end
			end
		end,
	})
end

local M = {
	"williamboman/mason.nvim",
	config = config,
	run = ":MasonUpdate", -- :MasonUpdate updates registry contents
	requires = {
		"williamboman/mason-lspconfig.nvim",
	},
	after = { "nvim-lspconfig" },
}

return M
