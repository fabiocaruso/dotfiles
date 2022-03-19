local config = function()
	vim.api.nvim_set_keymap("n", "<leader>km", ":lua require('legendary').find()<cr>", { noremap = true })
	require('legendary').setup({
		-- Include builtins by default, set to false to disable
		include_builtin = true,
		-- When you trigger an item via legendary.nvim,
		-- show it at the top next time you use legendary.nvim
		most_recent_item_at_top = true,
		-- Initial keymaps to bind
		keymaps = {
			-- your keymap tables here
		},
		-- Initial commands to bind
		commands = {
			-- your command tables here
		},
		-- Initial augroups and autocmds to bind
		autocmds = {
			-- your autocmd tables here
		},
	})
end

local M = {
	'mrjones2014/legendary.nvim',
	config = config,
};

return M;
