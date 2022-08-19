local config = function()
	-- TODO: Make this thing generically accessible through _G._config.file_explorer
	vim.g.indent_blankline_bufname_exclude = {
		'neo-tree filesystem .*',
	}

	require("indent_blankline").setup {
		show_current_context = true,
		--max_indent_increase = 1,
	}
end

local M = {
	'lukas-reineke/indent-blankline.nvim',
	config = config,
};

return M;
