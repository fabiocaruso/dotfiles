local config = function()
	local gc = _G._config
	local config_signs = gc.lsp.appearance.signs
	require("bufferline").setup({
		options = {
			diagnostics = "nvim_lsp",
			separator_style = "slant",
			diagnostics_indicator = function(count, level, diagnostics_dict, context)
				local s = ""
				for e, n in pairs(diagnostics_dict) do
					local sym = ""
					if e == "error" then
						sym = config_signs.error.sym
					elseif e == "warning" then
						sym = config_signs.warning.sym
					elseif e == "hint" then
						sym = config_signs.hint.sym
					elseif e == "info" then
						sym = config_signs.information.sym
					end
					s = s .. sym .. n .. " "
				end
				s = s:gsub("^%s*(.-)%s*$", "%1")
				return s
			end
		},
	})
end

local M = {
	'akinsho/bufferline.nvim',
	config = config,
}

return M
