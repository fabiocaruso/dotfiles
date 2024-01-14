local config = function()
	-- Icon definitions
	vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "red", linehl = "", numhl = "" })
	vim.fn.sign_define("DapBreakpointCondition", { text = "ᶜ", texthl = "red", linehl = "", numhl = "" })
	vim.fn.sign_define("DapBreakpointRejected", { text = "", texthl = "red", linehl = "", numhl = "" })
	vim.fn.sign_define("DapLogPoint", { text = "ᶫ", texthl = "", linehl = "", numhl = "" })
	vim.fn.sign_define("DapStopped", { text = "⟶", texthl = "green", linehl = "", numhl = "" })
	-- Setup
	local dap, dapui = require("dap"), require("dapui")
	--dap.set_log_level("DEBUG")
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
	-- CodeLLDB autostart
	-- TODO: Check for debug adapter installation
	-- TODO: Plugin independency
	local registry = require("mason-registry")
	-- TODO: Call this function in an async fashion (see https://github.com/williamboman/mason.nvim/blob/main/doc/mason.txt#L516)
	registry.refresh()
	local packages = registry.get_installed_packages()
	local dap_adapters = vim.tbl_filter(function(package)
		if vim.tbl_contains(package.spec.categories, "DAP") then
			return package
		end
	end, packages)
	--print(vim.inspect(dap_adapters))
	--local get_binary_path = function(name)
		---- TODO: Handle not in registry
		--if registry.has_package(name) then
			--return registry.get_package(name):get_install_path()
		--end
	--end
	--local codelldb_base_path = get_binary_path("codelldb")
	--local extension_path = vim.fn.stdpath("data") .. "/mason/packages/codelldb/extension/"
	--dap.adapters.codelldb = {
	--type = "server",
	--port = "${port}",
	--executable = {
	--command = codelldb_base_path .. "/extension/adapter/codelldb", --extension_path .. "adapter/codelldb",
	--args = { "--port", "${port}" },
	---- maybe uncomment on windows
	---- detached = false,
	--},
	--}
	--dap.adapters.lldb = {
		--type = "executable",
		--command = codelldb_base_path .. "/extension/lldb/bin/lldb",
		--name = "lldb",
	--}
	-- C++ config
	dap.configurations.cpp = {
		{
			name = "Launch file",
			type = "codelldb",
			request = "launch",
			program = function()
				return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
			end,
			cwd = "${workspaceFolder}",
			stopOnEntry = true,
		},
	}
end

local M = {
	"mfussenegger/nvim-dap",
	config = config,
	requires = {
		{ "rcarriga/nvim-dap-ui" },
	},
	after = {
		"mason.nvim",
	},
	keymaps = {
		{
			"n",
			"<leader>dd",
			function()
				-- TODO: Make this lang/plugin independent
				--vim.cmd("RustDebuggables")
			end,
			{ noremap = true },
			description = "Open the debugger and start debug the function under cursor",
		},
		{
			"n",
			"<leader>dx",
			function()
				require("dapui").close()
			end,
			{ noremap = true },
			description = "Close the debugger",
		},
		{
			"n",
			"<leader>dc",
			function()
				require("dap").continue()
			end,
			{ noremap = true },
			description = "Debugger (c)ontinue",
		},
		{
			"n",
			"<leader>di",
			function()
				require("dap").step_into()
			end,
			{ noremap = true },
			description = "Debugger step (i)nto",
		},
		{
			"n",
			"<leader>dv",
			function()
				require("dap").step_over()
			end,
			{ noremap = true },
			description = "Debugger step o(v)er",
		},
		{
			"n",
			"<leader>do",
			function()
				require("dap").step_out()
			end,
			{ noremap = true },
			description = "Debugger step (o)ut",
		},
		{
			"n",
			"<leader>db",
			function()
				require("dap").toggle_breakpoint()
			end,
			{ noremap = true },
			description = "Debugger toggle (b)reakpoint",
		},
		{
			"n",
			"<leader>dr",
			function()
				require("dap").repl.open()
			end,
			{ noremap = true },
			description = "Debugger open (r)epl",
		},
		{
			"n",
			"<F5>",
			function()
				require("dap").continue()
			end,
			{ noremap = true },
			description = "Debugger (c)ontinue",
		},
		{
			"n",
			"<F6>",
			function()
				require("dap").step_into()
			end,
			{ noremap = true },
			description = "Debugger step (i)nto",
		},
		{
			"n",
			"<F7>",
			function()
				require("dap").step_over()
			end,
			{ noremap = true },
			description = "Debugger step o(v)er",
		},
		{
			"n",
			"<F8>",
			function()
				require("dap").step_out()
			end,
			{ noremap = true },
			description = "Debugger step (o)ut",
		},
		{
			"n",
			"<F9>",
			function()
				require("dap").toggle_breakpoint()
			end,
			{ noremap = true },
			description = "Debugger toggle (b)reakpoint",
		},
		{
			"n",
			"<F10>",
			function()
				require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
			end,
			{ noremap = true },
			description = "Debugger set conditional breakpoint",
		},
		{
			"n",
			"<F11>",
			function()
				require("dap").set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
			end,
			{ noremap = true },
			description = "Debugger set logpoint",
		},
	},
}

return M
