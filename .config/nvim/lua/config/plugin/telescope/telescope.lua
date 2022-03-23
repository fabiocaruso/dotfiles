-- Note: requires ripgrep to work well
local config = function()
	local actions = require('telescope.actions')
	require('telescope').setup {
		defaults = {
			color_devicons = true,
			file_sorter = require('telescope.sorters').get_fzy_sorter,
			file_previewer = require('telescope.previewers').vim_buffer_cat.new,
			mappings = {
				i = {
					["<C-n>"] = false,
					["<C-p>"] = false,
					["<C-k>"] = actions.move_selection_previous,
					["<C-j>"] = actions.move_selection_next,
				}
			}
		},
		extensions = {
			fzy_native = {
				override_generic_sorter = false,
				override_file_sorter = true,
			},
			["ui-select"] = {
				require("telescope.themes").get_dropdown {
					-- even more opts
				}
			}
		}
	}
	require('telescope').load_extension('fzy_native')
	require("telescope").load_extension("ui-select")
end

local M = {
	'nvim-telescope/telescope.nvim',
	config = config,
};

return M;
