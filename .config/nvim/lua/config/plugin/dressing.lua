local config = function()
	require("dressing").setup()
end

local M = {
	"stevearc/dressing.nvim",
	config = config,
	keymaps = {},
}

return M
