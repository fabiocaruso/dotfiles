local config = function()
	local gc = _G._config
	local utils = require('config.utils')
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
	'simrat39/rust-tools.nvim',
	config = config,
};

return M;
