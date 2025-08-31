local config = function()
	require("opencode").setup()
end

local M = {
	"NickvanDyke/opencode.nvim",
	requires = {
		-- Recommended for better prompt input, and required to use opencode.nvim's embedded terminal — otherwise optional
		{ "folke/snacks.nvim", opts = { input = { enabled = true } } },
	},
	config = config,
	keymaps = {
		---- Recommended keymaps
		{
			"n",
			"<leader>oA",
			function()
				require("opencode").ask()
			end,
			{ noremap = true },
			description = "Ask opencode",
		},
		{
			"n",
			"<leader>oa",
			function()
				require("opencode").ask("@cursor: ")
			end,
			{ noremap = true },
			description = "Ask opencode about this",
		},
		{
			'n',
			"<leader>oa",
			function()
				require("opencode").ask("@selection: ")
			end,
			{ noremap = true },
			description = "Ask opencode about selection",
		},
		{
			'n',
			"<leader>ot",
			function()
				require("opencode").toggle()
			end,
			{ noremap = true },
			description = "Toggle embedded opencode",
		},
		{
			'n',
			"<leader>on",
			function()
				require("opencode").command("session_new")
			end,
			{ noremap = true },
			description = "New session",
		},
		{
			'n',
			"<leader>oy",
			function()
				require("opencode").command("messages_copy")
			end,
			{ noremap = true },
			description = "Copy last message",
		},
		{
			'n',
			"<S-C-u>",
			function()
				require("opencode").command("messages_half_page_up")
			end,
			{ noremap = true },
			description = "Scroll messages up",
		},
		{
			'n',
			"<S-C-d>",
			function()
				require("opencode").command("messages_half_page_down")
			end,
			{ noremap = true },
			description = "Scroll messages down",
		},
		{
			'n',
			"<leader>op",
			function()
				require("opencode").select_prompt()
			end,
			{ noremap = true },
			description = "Select prompt",
		},
	},
}

return M
