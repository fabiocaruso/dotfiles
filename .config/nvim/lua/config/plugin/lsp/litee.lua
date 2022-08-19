local lib_config = function()
	require('codicons').setup({})
	require('litee.lib').setup({
		tree = {
			icons = require('litee.lib.icons').nerd,
			icon_set = "nerd",
		},
		panel = {
			orientation = "right",
		},
	})
end

local calltree_config = function()
	require('litee.calltree').setup({
		on_open = "panel",
		icon_set = "nerd",
	})
end

local symboltree_config = function()
	require('litee.symboltree').setup({
		on_open = "panel",
		icon_set = "nerd",
	})
end

local M = {
	'ldelossa/litee.nvim',
	config = lib_config,
	requires = {
		{'mortepau/codicons.nvim'},
		{
			'ldelossa/litee-calltree.nvim',
			config = calltree_config,
		},
		{
			'ldelossa/litee-symboltree.nvim',
			config = symboltree_config,
		},
	},
};

return M;
