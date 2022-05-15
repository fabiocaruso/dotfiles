local config = function()
	local dap, dapui = require("dap"), require("dapui")
	dapui.setup()
	dap.listeners.after.event_initialized["dapui_config"] = function()
		dapui.open()
	end
	dap.listeners.before.event_terminated["dapui_config"] = function()
		dapui.close()
	end
	dap.listeners.before.event_exited["dapui_config"] = function()
		dapui.close()
	end
end

local M = {
	'mfussenegger/nvim-dap',
	config = config,
	requires = {
		{'rcarriga/nvim-dap-ui'},
	},
	keymaps = {
		{
			'n',
			'<leader>dd',
			function ()
				-- TODO: Make this lang/plugin independent
				vim.cmd("RustDebuggables")
				--require('dapui').open()
			end,
			{ noremap = true },
			description = "Open the debugger",
		},
		{
			'n',
			'<leader>dx',
			function ()
				require('dapui').close()
			end,
			{ noremap = true },
			description = "Close the debugger",
		},
		{
			'n',
			'<leader>dc',
			function ()
				require('dap').continue()
			end,
			{ noremap = true },
			description = "Debugger (c)ontinue",
		},
		{
			'n',
			'<leader>di',
			function()
				require('dap').step_into()
			end,
			{ noremap = true },
			description = "Debugger step (i)nto",
		},
		{
			'n',
			'<leader>dv',
			function()
				require('dap').step_over()
			end,
			{ noremap = true },
			description = "Debugger step o(v)er",
		},
		{
			'n',
			'<leader>do',
			function()
				require('dap').step_out()
			end,
			{ noremap = true },
			description = "Debugger step (o)ut",
		},
		{
			'n',
			'<leader>db',
			function()
				require('dap').toggle_breakpoint()
			end,
			{ noremap = true },
			description = "Debugger toggle (b)reakpoint",
		},
		{
			'n',
			'<leader>dr',
			function()
				require('dap').repl.open()
			end,
			{ noremap = true },
			description = "Debugger open (r)epl",
		},
		{
			'n',
			'<F5>',
			function()
				require('dap').continue()
			end,
			{ noremap = true },
			description = "Debugger (c)ontinue",
		},
		{
			'n',
			'<F6>',
			function()
				require('dap').step_into()
			end,
			{ noremap = true },
			description = "Debugger step (i)nto",
		},
		{
			'n',
			'<F7>',
			function()
				require('dap').step_over()
			end,
			{ noremap = true },
			description = "Debugger step o(v)er",
		},
		{
			'n',
			'<F8>',
			function()
				require('dap').step_out()
			end,
			{ noremap = true },
			description = "Debugger step (o)ut",
		},
		{
			'n',
			'<F9>',
			function()
				require('dap').toggle_breakpoint()
			end,
			{ noremap = true },
			description = "Debugger toggle (b)reakpoint",
		},
		{
			'n',
			'<F10>',
			function ()
				require('dap').set_breakpoint(vim.fn.input("Breakpoint condition: "))
			end,
			{ noremap = true },
			description = "Debugger set conditional breakpoint",
		},
		{
			'n',
			'<F11>',
			function ()
				require('dap').set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
			end,
			{ noremap = true },
			description = "Debugger set logpoint",
		},
	},
};

return M;
