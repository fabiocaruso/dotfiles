local config = function()
	local gc = _G._config
	local utils = require('config.utils')
	-- TODO: Download and install vscode-lldb in the install script
	local extension_path = vim.fn.stdpath('data') .. '/mason/packages/codelldb/extension/'
	local codelldb_path = extension_path .. 'adapter/codelldb'
	local liblldb_path = extension_path .. 'lldb/lib/liblldb.dylib'
	local rt = require('i-love-rust')
	rt.setup({
		tools = {
			keymaps = {},

			-- show function signature in hover when the cursor is on '(' or after it in insert mode
			-- and show parameter name after or on ',' character
			--auto_signature_help = true,

			--- highlight all occurence of the entity under the cursor
			setup_document_highlight = true,

			-- if not nil, use rust-analyzer semantic to highlight code
			highlight = {
				-- function for highliting, default to require"i-love-rust".highlighting.simple_highlighter
				--  param: token
				--    token.type => string, token type
				--    token.modifiers => list of token modifiers
				--    token.modifiers:contains(modifier) => return true if modifier in modifiers list
				--    token:highlight(group) => apply higlight group to token
				--    token:get_text() => return the token string
				--  exemple => see `simple_highlighter` in module "lua/i-love-rust/highlighting.lua"
				--  to see list of types and modifiers, run the command
				--    :lua print(vim.inspect(require"i-love-rust.semantic".legend))
				token_highlighter = nil,

				-- shall vim syntax be kept
				overlay_syntax = false,

				-- rust-analyzer may be long before it has finished to compute
				-- Before rust-analyzer provides code semantic use this syntax file
				--temporary_highlight_syntax = package_root .. "syntax/simple_rust.vim",
			},

			-- automatically set inlay hints (type hints)
			-- There is an issue due to which the hints are not applied on the first
			-- opened file. For now, write to the file to trigger a reapplication of
			-- the hints or just run :RustSetInlayHints.
			-- default: true
			autoSetHints = true,

			-- automatically set code lenses
			-- There is an issue. For now, write to the file to trigger a reapplication of
			-- the code lenses or just run :RustSetCodeLens.
			-- default: true
			autoSetCodeLenses = false,

			-- whether to show hover actions inside the hover window
			-- this overrides the default hover handler so something like lspsaga.nvim's hover would be overriden by this
			-- default: true
			hover_with_actions = true,

			-- These apply to the default RustRunnables command
			runnables = {
				-- whether to use telescope for selection menu or not
				-- default: true
				use_telescope = true

				-- rest of the opts are forwarded to telescope
			},

			-- These apply to the default RustSetInlayHints command
			inlay_hints = {

				-- Only show inlay hints for the current line
				only_current_line = false,

				-- Event which triggers a refersh of the inlay hints.
				-- You can make this "CursorMoved" or "CursorMoved,CursorMovedI" but
				-- not that this may cause  higher CPU usage.
				-- This option is only respected when only_current_line and
				-- autoSetHints both are true.
				only_current_line_autocmd = "CursorHold",

				-- wheter to show parameter hints with the inlay hints or not
				-- default: true
				show_parameter_hints = false,

				-- prefix for parameter hints
				-- default: "<-"
				parameter_hints_prefix = "    ",

				-- prefix for all the other hints (type, chaining)
				-- default: "=>"
				other_hints_prefix = "   :",

				-- whether to align to the lenght of the longest line in the file
				max_len_align = false,

				-- padding from the left if max_len_align is true
				max_len_align_padding = 1,

				-- whether to align to the extreme right or not
				right_align = false,

				-- padding from the right if right_align is true
				right_align_padding = 7,

				-- The color of the hints
				highlight = "InlayHints"
			},

			hover_actions = {
				-- the border that is used for the hover window
				-- see vim.api.nvim_open_win()
				border = {
					{ "╭", "FloatBorder" }, { "─", "FloatBorder" },
					{ "╮", "FloatBorder" }, { "│", "FloatBorder" },
					{ "╯", "FloatBorder" }, { "─", "FloatBorder" },
					{ "╰", "FloatBorder" }, { "│", "FloatBorder" }
				},

				-- whether the hover action window gets automatically focused
				-- default: false
				auto_focus = false,

				-- weither code_actions appear in floating window (true) or
				-- in a dedicated window
				float_code_actions = false,

				-- weither hover appear in floating window
				float_hover = true
			},

			-- debugger support configuration
			dap_adapter = {
				type = 'executable',
				command = 'lldb',
				name = "rt_lldb"
			}

		},

		-- all the opts to send to nvim-lspconfig
		-- these override the defaults set by i-love-rust.nvim
		-- see https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#rust_analyzer
		-- rust-analyer options
		server = {
			settings = {
				["rust-analyzer"] = {
					hoverActions = {
						references = true,
					},
					lens = {
						methodReferences = false,
					},
				}
			}
		}
	})
end

local M = {
	'https://gitlab.com/okannen/i-love-rust.nvim',
	as = 'i-love-rust.nvim',
	config = config,
	enabled = false,
	requires = {
		{ 'mfussenegger/nvim-dap' },
		{ 'nvim-lua/plenary.nvim' },
	},
};

return M;
