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
			},
			vimgrep_arguments = { "rg", "--vimgrep", "--color=never", "--no-heading", "--with-filename", "--line-number",
				"--column", "--smart-case", "--hidden", "--glob", "!.git/*" },
		},
		pickers = {
			find_files = {
				find_command = { "rg", "--files", "--vimgrep", "--color=never", "--no-heading", "--with-filename", "--line-number",
				"--column", "--smart-case", "--hidden", "--glob", "!.git/*" },
			},
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
	require('telescope').load_extension('ui-select')
	require('telescope').load_extension('notify')
end

local call_ts_fun = function(fun, opts)
	local ok, builtin = pcall(require, 'telescope.builtin')
	if ok and builtin[fun] ~= nil then
		builtin[fun](opts)
	end
end

local M = {
	'nvim-telescope/telescope.nvim',
	config = config,
	requires = {
		'nvim-telescope/telescope-fzy-native.nvim',
		'nvim-telescope/telescope-ui-select.nvim',
		'rcarriga/nvim-notify',
	},
	after = {
		'nvim-notify',
	},
	keymaps = {
		{
			'n',
			';',
			function()
				call_ts_fun('find_files', {})
			end,
			{ noremap = true },
			description = "Open telescope files finder",
		},
		{
			'n',
			',',
			function()
				call_ts_fun('live_grep', {})
			end,
			{ noremap = true },
			description = "Open telescope live grep",
		},
		{
			'n',
			'-',
			function()
				call_ts_fun('buffers', {})
			end,
			{ noremap = true },
			description = "Open telescope buffer finder",
		},
		{
			'n',
			'<leader>fgb',
			function()
				call_ts_fun('git_branches', {})
			end,
			{ noremap = true },
			description = "Open telescope git branch finder",
		},
		{
			'n',
			'<leader>gc',
			function()
				call_ts_fun('git_commits', {})
			end,
			{ noremap = true },
			description = "Open telescope git commit finder",
		},
		{
			'n',
			'<leader>gs',
			function()
				call_ts_fun('git_status', {})
			end,
			{ noremap = true },
			description = "Open telescope git status finder",
		},
		{
			'n',
			'<leader>lr',
			function()
				call_ts_fun('lsp_references', {})
			end,
			{ noremap = true },
			description = "LSP show references for word under cursor",
		},
		{
			'n',
			'<leader>ic',
			function()
				call_ts_fun('lsp_incoming_calls', {})
			end,
			{ noremap = true },
			description = "LSP show incoming calls for word under cursor",
		},
		{
			'n',
			'<leader>oc',
			function()
				call_ts_fun('lsp_outgoing_calls', {})
			end,
			{ noremap = true },
			description = "LSP show outgoing calls for word under cursor",
		},
		{
			'n',
			'<leader>ds',
			function()
				call_ts_fun('lsp_document_symbols', {})
			end,
			{ noremap = true },
			description = "LSP show document symbols for the current buffer",
		},
		{
			'n',
			'<leader>lws',
			function()
				call_ts_fun('lsp_workspace_symbols', {})
			end,
			{ noremap = true },
			description = "LSP show workspace symbols for the current workspace",
		},
		{
			'n',
			'<leader>li',
			function()
				call_ts_fun('lsp_implementations', {})
			end,
			{ noremap = true },
			description = "LSP go to implementation of word under cursor",
		},
		{
			'n',
			'<leader>ld',
			function()
				call_ts_fun('lsp_definitions', {})
			end,
			{ noremap = true },
			description = "LSP go to definitions of word under cursor",
		},
		{
			'n',
			'<leader>ltd',
			function()
				call_ts_fun('lsp_type_definitions', {})
			end,
			{ noremap = true },
			description = "LSP go to type definition of word under cursor",
		},
	},
};

return M;
