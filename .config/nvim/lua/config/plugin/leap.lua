local config = function()
	require('leap').setup({})
	require('leap').add_default_mappings()
end

local M = {
	'ggandor/leap.nvim',
	-- TODO: This plugin overwrites x in visual mode, which interferes with cut. Find other keymappings..
	enabled = false,
	config = config,
}

return M
