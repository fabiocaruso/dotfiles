local luasnip_config = function()
	require("luasnip.loaders.from_vscode").lazy_load()
end

local has_words_before = function()
	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
	return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local cmp_config = function()
	local gc = _G._config
	local cmp = require("cmp")
	local lspkind = require("lspkind")
	local luasnip = require("luasnip")
	vim.api.nvim_set_option("pumheight", 20)
	vim.api.nvim_set_option("pumwidth", 80)
	cmp.setup({
		snippet = {
			expand = function(args)
				luasnip.lsp_expand(args.body)
			end,
		},
		mapping = {
			["<C-j>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "c" }),
			["<C-k>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "c" }),
			["<C-y>"] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
			--[[['<C-e>'] = cmp.mapping({
			i = cmp.mapping.abort(),
			c = cmp.mapping.close(),
			}),]]
			--
			--[[['<S-Tab>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
			['<Tab>'] = cmp.mapping.confirm({
			behavior = cmp.ConfirmBehavior.Replace,
			select = true,
			}),]]
			-- -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
			["<S-Tab>"] = cmp.mapping(function(fallback)
				if luasnip.jumpable(-1) then
					luasnip.jump(-1)
				elseif cmp.visible() == false then
					cmp.complete()
				else
					fallback()
				end
			end, { "i", "c" }),
			["<Tab>"] = cmp.mapping({
				i = function(fallback)
					if cmp.visible() then
						cmp.confirm({
							behavior = cmp.ConfirmBehavior.Replace,
							select = false,
						})
					elseif luasnip.expand_or_jumpable() then
						luasnip.expand_or_jump()
					elseif has_words_before() then
						cmp.complete()
					else
						fallback()
					end
				end,
				c = function(fallback)
					if cmp.visible() then
						cmp.confirm({
							behavior = cmp.ConfirmBehavior.Replace,
							select = true,
						})
					elseif luasnip.expand_or_jumpable() then
						luasnip.expand_or_jump()
					else
						fallback()
					end
				end,
			}),
			["<CR>"] = cmp.mapping.confirm({
				behavior = cmp.ConfirmBehavior.Replace,
				select = false,
			}),
		},
		sources = cmp.config.sources({
			{ name = "codeium" },
			{ name = "luasnip" },
			{ name = "nvim_lsp" },
			{ name = "nvim_lua" },
			--{ name = 'luasnip', option = { use_show_condition = false } },
			{ name = "crates" },
			{ name = "doxygen" },
		}, {
			{ name = "buffer", keyword_length = 5 },
		}),
		formatting = {
			format = lspkind.cmp_format({
				--with_text = true,
				maxwidth = 50,
				ellipsis_char = '...',
				menu = {
					buffer = "[Buffer]",
					nvim_lsp = "[LSP]",
					luasnip = "[LuaSnip]",
					crates = "[Crates]",
					doxygen = "[Doxygen]",
					cmdline = "[CmdLine]",
					nvim_lua = "[Lua]",
					codeium = "[Codeium]",
				},
				symbol_map = { Codeium = "", }
			}),
		},
		experimental = {
			ghost_text = true,
		},
	})
	-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
	cmp.setup.cmdline("/", {
		sources = {
			{ name = "buffer" },
		},
	})
	-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
	cmp.setup.cmdline(":", {
		sources = cmp.config.sources({
			{ name = "path" },
		}, {
			{ name = "cmdline" },
		}),
	})
	--gc.lsp.capabilities = require('cmp_nvim_lsp').update_capabilities(gc.lsp.capabilities)
	local cmp_lsp_cap = require("cmp_nvim_lsp").default_capabilities()
	gc.lsp.capabilities = vim.tbl_deep_extend("keep", gc.lsp.capabilities, cmp_lsp_cap)
end

local M = {
	"hrsh7th/nvim-cmp",
	config = cmp_config,
	requires = {
		{ "nvim-treesitter/nvim-treesitter" },
		{ "onsails/lspkind-nvim" },
		{ "saecki/crates.nvim" },
		{ "hrsh7th/cmp-nvim-lsp" },
		{ "hrsh7th/cmp-nvim-lua" },
		{ "paopaol/cmp-doxygen" },
		{ "saadparwaiz1/cmp_luasnip" },
		{
			"L3MON4D3/LuaSnip",
			tag = "v1.*",
			config = luasnip_config,
		},
	},
}

return M
