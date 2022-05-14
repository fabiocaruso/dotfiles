local config = function()
	local dap_install = require("dap-install")
	dap_install.setup({
		installation_path = vim.fn.stdpath("data") .. "/dapinstall/",
	})
end

local M = {
	'Pocco81/DAPInstall.nvim',
	config = config,
	branch = 'dev',
};

return M;
