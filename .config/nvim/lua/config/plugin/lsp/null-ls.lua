local config = function()
	local null_ls = require("null-ls")
	null_ls.setup({
		sources = {
			null_ls.builtins.formatting.stylua,
			null_ls.builtins.completion.spell,
			null_ls.builtins.code_actions.gitsigns,
			null_ls.builtins.completion.tags,
			null_ls.builtins.diagnostics.checkmake,
			null_ls.builtins.diagnostics.chktex,
			null_ls.builtins.diagnostics.cue_fmt,
			null_ls.builtins.diagnostics.hadolint,
			null_ls.builtins.diagnostics.jsonlint,
			null_ls.builtins.diagnostics.markdownlint,
			null_ls.builtins.diagnostics.selene,
			null_ls.builtins.diagnostics.sqlfluff,
			null_ls.builtins.diagnostics.vint,
			null_ls.builtins.diagnostics.yamllint,
			null_ls.builtins.formatting.asmfmt,
			null_ls.builtins.formatting.cue_fmt,
			null_ls.builtins.formatting.djlint,
			null_ls.builtins.formatting.fixjson,
			null_ls.builtins.formatting.latexindent,
			null_ls.builtins.formatting.lua_format,
			null_ls.builtins.formatting.lua_format,
			null_ls.builtins.formatting.taplo,
			null_ls.builtins.formatting.tidy,
			null_ls.builtins.formatting.xmllint,
		},
	})
end

local M = {
	'jose-elias-alvarez/null-ls.nvim',
	requires = {
		"nvim-lua/plenary.nvim",
	},
	config = config,
}

return M
