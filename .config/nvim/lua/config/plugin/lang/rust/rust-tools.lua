local config = function()
	local gc = _G._config
	local utils = require('config.utils')
	-- TODO: Download and install vscode-lldb in the install script
	local extension_path = vim.fn.stdpath('data') .. '/mason/packages/codelldb/extension/'
	local codelldb_path = extension_path .. 'adapter/codelldb'
	local liblldb_path = extension_path .. 'lldb/lib/liblldb.dylib'
	require('rust-tools').setup({
		tools = { -- rust-tools options
			autoSetHints = true,
			hover_with_actions = true,
			hover_actions = {
				auto_focus = true,
			},
		},
		server = {
			on_attach = utils.merge_fns(gc.lsp.on_attach),
			capabilities = gc.lsp.capabilities,
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
end

local M = {
	'Freyskeyd/rust-tools.nvim',
	config = config,
	branch = 'dap_fix',
	requires = {
		{ 'mfussenegger/nvim-dap' },
		{ 'nvim-lua/plenary.nvim' },
	},
};

return M;
