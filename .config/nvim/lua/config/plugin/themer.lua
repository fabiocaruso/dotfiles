local config = function()
	local gc = _G._config
	local colorscheme = 'gruvbox'
	local color_palette = require("themer.modules.core.api").get_cp(colorscheme)
	require("themer").setup({
		colorscheme = colorscheme,
		enable_installer = true,
		--styles = {
		--number = { fg = color_palette.border },
		--},
		remaps = {
			highlights = {
				globals = {
					base = {
						CursorColumn = { link = "CursorLine" },
						ColorColumn = { link = "CursorLine" },
						Visual = { style = "reverse", bg = color_palette.pum.bg },
						VertSplit = { bg = "NONE", fg = color_palette.border },
						NormalFloat = { bg = color_palette.dimmed.subtle },
						Pmenu = { bg = color_palette.dimmed.subtle },
						PmenuSel = { bg = color_palette.pum.sel.bg, fg = "white" },
					},
					plugins = {
						cmp = {
							CmpItemKindSnippet = { link = "ThemerField" },
							CmpItemMenu = { bg = color_palette.dimmed.subtle },
						},
					}
				},
				gruvbox = {
					base = {
						LineNr = { fg = color_palette.border },
						Number = { fg = color_palette.syntax.number },
					},
					plugins = {
						indentline = {
							IndentBlanklineChar = { fg = color_palette.border, style = "nocombine" },
						},
					}
				},
				everforest = {
					themer = {
					},
					base = {
					},
					plugins = {
						treesitter = {
							["@punctuation.bracket"] = { fg = "green" --[[color_palette.syntax.punctuation]] , bg = "white" --[[color_palette.dimmed.subtle]] },
							TSPunctBracket = { fg = "green" --[[color_palette.syntax.punctuation]] , bg = "white" --[[color_palette.dimmed.subtle]] },
						},
					}
				},
			},
		}
	})
end

local M = {
	'themercorp/themer.lua',
	after = {
		'lualine.nvim'
	},
	config = config,
};

return M;
