local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local config = function()
	local null_ls = require("null-ls")
	local helpers = require("null-ls.helpers")
	null_ls.setup({
		on_init = function(new_client, _)
			--new_client.offset_encoding = 'utf-16'
		end,
		on_attach = function(client, bufnr)
			if client.supports_method("textDocument/formatting") then
				vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
				vim.api.nvim_create_autocmd("BufWritePost", {
					group = augroup,
					buffer = bufnr,
					callback = function()
						vim.lsp.buf.format({
							bufnr = bufnr,
							filter = function(c)
								return c.name == "null-ls"
							end,
						})
					end,
				})
			end
		end,
		sources = {
			null_ls.builtins.formatting.stylua,
			--null_ls.builtins.completion.spell,
			null_ls.builtins.code_actions.gitsigns,
			null_ls.builtins.completion.tags,
			null_ls.builtins.diagnostics.checkmake,
			null_ls.builtins.diagnostics.chktex,
			null_ls.builtins.diagnostics.cue_fmt,
			null_ls.builtins.diagnostics.hadolint,
			null_ls.builtins.diagnostics.jsonlint,
			null_ls.builtins.diagnostics.markdownlint,
			-- TODO: tracking issue: https://github.com/Kampfkarren/selene/issues/339
			--null_ls.builtins.diagnostics.selene.with({
			--cwd = function(_params)
			--return vim.fn.expand("~/.config/nvim/")
			--end,
			--generator_opts = {
			--command = "selene",
			--args = { "--config", "~/.config/nvim/selene.toml", "--display-style", "quiet", "-" },
			--to_stdin = true,
			--format = "line",
			--check_exit_code = function(code)
			--return code <= 1
			--end,
			--on_output = helpers.diagnostics.from_pattern(
			-- [[(%d+):(%d+): (%w+)%[([%w_]+)%]: ([`]*([%w_]+)[`]*.*)]],
			--{ "row", "col", "severity", "code", "message", "_quote" },
			--{ adapters = { helpers.diagnostics.adapters.end_col.from_quote } }
			--),
			--},
			--}),
			null_ls.builtins.diagnostics.sqlfluff,
			null_ls.builtins.diagnostics.vint,
			null_ls.builtins.diagnostics.yamllint,
			--null_ls.builtins.diagnostics.mypy,
			null_ls.builtins.formatting.asmfmt,
			null_ls.builtins.formatting.cue_fmt,
			null_ls.builtins.formatting.djlint,
			null_ls.builtins.formatting.fixjson,
			null_ls.builtins.formatting.latexindent,
			--null_ls.builtins.formatting.lua_format,
			null_ls.builtins.formatting.taplo,
			null_ls.builtins.formatting.tidy,
			null_ls.builtins.formatting.xmllint,
		},
	})
end

local M = {
	"jose-elias-alvarez/null-ls.nvim",
	requires = {
		"nvim-lua/plenary.nvim",
	},
	config = config,
}

return M
