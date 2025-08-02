local config = function()
	local gc = _G._config
	require("trouble").setup({
		auto_close = true,
		padding = false,
		action_keys = {
			hover = "h",
		},
		use_diagnostic_signs = true,
		modes = {
			diagnostics = {
				source = "diagnostics",
				auto_open = true,
			},
		},
	})
	-- TODO: Make this better
	vim.api.nvim_create_autocmd({ "FileType" }, {
		callback = function(args)
			local bufnr = args.buf
			if vim.bo[bufnr].filetype == "Trouble" then
				vim.o.cc = ""
				vim.wo.cursorcolumn = false
			end
		end,
	})
	vim.api.nvim_set_hl(0, "TroubleText", { bg = "NONE" })
end

local M = {
	"folke/trouble.nvim",
	after = {
		"themer.lua",
	},
	config = config,
}

return M
