local config = function()
end

local M = {
	'famiu/bufdelete.nvim',
	config = config,
	keymaps = {
		{
			'n',
			'<s-x>',
			'<Cmd>Bdelete<cr>',
			{ noremap = true },
			description = "Fast delete buffer",
		},
	},
};

return M;
