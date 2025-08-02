local keymaps = {
	{
		"n",
		"<leader>ps",
		function()
			return require("debugprint").debugprint()
		end,
		{ noremap = true, expr = true },
		description = "Insert a print statement",
	},
	{
		"n",
		"<leader>pv",
		function()
			return require("debugprint").debugprint({ variable = true })
		end,
		{ noremap = true, expr = true },
		description = "Insert a print statement with variable under cursor",
	},
	{
		"n",
		"<leader>pd",
		function()
			return require("debugprint").deleteprints()
		end,
		{ noremap = true, expr = true },
		description = "Delete all added print statements for debugging",
	},
}

-- TODO: Do it in the plugin definition, currently it does not work there
for _, map in ipairs(keymaps) do
vim.keymap.set(map[1], map[2], map[3], map[4])
end

local config = function()
	require("debugprint").setup({
		keymaps = {},
	})
end

local M = {
	"andrewferrier/debugprint.nvim",
	config = config,
}

return M
