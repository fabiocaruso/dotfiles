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
					local sym = e == "error" and config_signs.error .. " "
							or (e == "warning" and config_signs.warning .. " " or config_signs.hint .. " ")
					s = s .. n .. sym
				end
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
