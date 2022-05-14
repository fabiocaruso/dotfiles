local config = function()
	local gc = _G._config
	local config_signs = gc.lsp.appearance.signs
	require('lualine').setup({
		sections = {
			lualine_b = {
				'branch',
				'diff',
				{
					'diagnostics',
					symbols = {
						error = config_signs.error..' ',
						warn = config_signs.warning..' ',
						info = config_signs.information..' ',
						hint = config_signs.hint..' ',
					},
				}
			},
			lualine_c = { 'filename', 'g:coc_status', 'require("lsp-status").status()' },
			lualine_z = { function() return vim.fn.ObsessionStatus(gc.general.appearance.session_store, '') end, 'location' },
		},
		extensions = {
			'nvim-tree',
			'fugitive',
			'quickfix',
		},
		options = {
			globalstatus = true, -- Sets laststatus = 3
		},
	})
end

local M = {
	'nvim-lualine/lualine.nvim',
	config = config,
}

return M
