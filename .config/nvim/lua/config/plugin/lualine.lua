local config = function()
	require('lualine').setup({
		sections = {
			lualine_b = {
				'branch',
				'diff',
				{
					'diagnostics',
					symbols = {error = ' ', warn = ' ', info = ' ', hint = ' '},
				}
			},
			lualine_c = { 'filename', 'g:coc_status', 'require("lsp-status").status()' },
			lualine_z = { function() return vim.fn.ObsessionStatus('S', 'X') end, 'location' },
		},
		extensions = {
			'nvim-tree',
			'fugitive',
			'quickfix',
		},
	})
end

local M = {
	'nvim-lualine/lualine.nvim',
	config = config,
}

return M
