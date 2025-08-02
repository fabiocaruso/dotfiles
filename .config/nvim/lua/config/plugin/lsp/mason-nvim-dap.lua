local config = function()
	local dap = require("dap")
	local dap_to_ft = require("mason-nvim-dap.mappings.filetypes")
	local nvim_dap_to_package = require("mason-nvim-dap.mappings.source").nvim_dap_to_package
	local adapter_configs = require("mason-nvim-dap.mappings.adapters")
	vim.api.nvim_create_autocmd({ "BufEnter" }, {
		callback = function(event)
			if event.file == "" then
				return
			end
			local ft = vim.bo.filetype
			for debug_adapter, filetypes in pairs(dap_to_ft) do
				if
					not vim.tbl_contains(_G._states.dap.initialized_adapters, debug_adapter)
					and vim.tbl_contains(filetypes, ft)
				then
					local mason_package_name = nvim_dap_to_package[debug_adapter]
					local registry = require("mason-registry")
					local adapter_config = adapter_configs[debug_adapter]
					registry.update(function()
						if not registry.is_installed(mason_package_name) then
							registry.get_package(mason_package_name):install()
						end
						--print("Debug adapter: " .. debug_adapter)
						--print("Adapter config: " .. vim.inspect(adapter_config))
						--print("DAP config: " .. vim.inspect(dap.adapters))
						-- BUG: On first install the binary can't be loaded
						dap.adapters[debug_adapter] = adapter_config
						table.insert(_G._states.dap.initialized_adapters, debug_adapter)
					end)
				end
			end
		end,
	})
end

local M = {
	"jay-babu/mason-nvim-dap.nvim",
	config = config,
	requires = {
		"mfussenegger/nvim-dap",
		"williamboman/mason.nvim",
	},
	after = { "mason.nvim" },
}

return M
