local config = function()
	vim.notify = require("notify")
end

local M = {
	"rcarriga/nvim-notify",
	config = config,
	--enabled = false,
}

return M
