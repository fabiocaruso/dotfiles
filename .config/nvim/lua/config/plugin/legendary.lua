local config = function()
	local keymaps = {}
	local gkm = _G._config.keymaps
	for _, keymap in ipairs(gkm) do
		table.insert(keymaps, {
			keymap[2],
			keymap[3],
			description = keymap.description,
			mode = { keymap[1] }
		})
	end
	require('legendary').setup({
		-- Include builtins by default, set to false to disable
		include_builtin = true,
		-- When you trigger an item via legendary.nvim,
		-- show it at the top next time you use legendary.nvim
		most_recent_item_at_top = true,
		-- Initial keymaps to bind
		keymaps = keymaps,
		-- Initial commands to bind
		commands = {
			-- TODO: Add commands to list
			-- your command tables here
		},
		-- Initial augroups and autocmds to bind
		autocmds = {
			-- TODO: Add autocommands to list
			-- your autocmd tables here
		},
	})
end

local M = {
	'mrjones2014/legendary.nvim',
	config = config,
	keymaps = {
		{
			'n',
			'<leader>km',
			function()
				require('legendary').find()
			end,
			{ noremap = true },
			description = "Opens keymap legend",
		},
	},
};

return M;
