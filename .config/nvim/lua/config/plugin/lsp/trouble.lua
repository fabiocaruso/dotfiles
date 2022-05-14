local config = function()
	local gc = _G._config
	local config_signs = gc.lsp.appearance.signs
	require('trouble').setup({
		auto_open = true,
		auto_close = true,
		padding = false,
		action_keys = {
			hover = "h",
		},
		signs = {
			-- icons / text used for a diagnostic
			error = config_signs.error,
			warning = config_signs.warning,
			hint = config_signs.hint,
			information = config_signs.information,
			other = config_signs.success,
		},
	})
end

local M = {
	'folke/trouble.nvim',
	config = config,
};

return M;
