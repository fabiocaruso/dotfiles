local config = function()
	local gc = _G._config
	local config_signs = gc.lsp.appearance.signs
	--local custom_everforest = require('lualine.themes.everforest')
	require("lualine").setup({
		sections = {
			lualine_b = {
				"branch",
				"diff",
				{
					"diagnostics",
					symbols = {
						error = config_signs.error.sym .. " ",
						warn = config_signs.warning.sym .. " ",
						info = config_signs.information.sym .. " ",
						hint = config_signs.hint.sym .. " ",
					},
				},
			},
			lualine_c = { "filename", "g:coc_status", 'require("lsp-status").status()' },
			lualine_z = {
				function()
					return vim.fn.ObsessionStatus(gc.general.appearance.session_store, "")
				end,
				"location",
				"string.format('B# %s', vim.fn.bufnr())",
			},
		},
		extensions = {
			"nvim-tree",
			"fugitive",
			"quickfix",
		},
		options = {
			globalstatus = true, -- Sets laststatus = 3
			--theme = custom_everforest,
			theme = "gruvbox",
		},
	})
end

local M = {
	"nvim-lualine/lualine.nvim",
	config = config,
}

return M
