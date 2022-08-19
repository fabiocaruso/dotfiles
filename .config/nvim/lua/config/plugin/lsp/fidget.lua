local config = function()
	local gc = _G._config
	local config_signs = gc.lsp.appearance.signs
	require("fidget").setup({
		text = {
			spinner = "arc",         -- animation shown when tasks are ongoing
			done = config_signs.success,               -- character shown when all tasks are complete
			commenced = "Started",    -- message shown when task starts
			completed = "Completed",  -- message shown when task completes
		},
		timer = {
			spinner_rate = 50,       -- frame rate of spinner animation, in ms
			fidget_decay = 2000,      -- how long to keep around empty fidget, in ms
			task_decay = 1000,        -- how long to keep around completed task, in ms
		},
	})
end

local M = {
	'j-hui/fidget.nvim',
	config = config,
};

return M;
