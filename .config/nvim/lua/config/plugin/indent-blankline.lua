local config = function()
	require("indent_blankline").setup {
		show_current_context = true,
	}
end

local M = {
	'lukas-reineke/indent-blankline.nvim',
	config = config,
};

return M;
