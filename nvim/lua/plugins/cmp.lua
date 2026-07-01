-- completion engine lol
return {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
		{ "L3MON4D3/LuaSnip" },
		{ "hrsh7th/cmp-buffer" },
		{ "hrsh7th/cmp-nvim-lua" },
		{ "hrsh7th/cmp-nvim-lsp" },
		{ "hrsh7th/cmp-path" },
		{ "rafamadriz/friendly-snippets" },
		{ "saadparwaiz1/cmp_luasnip" },
		{ "onsails/lspkind.nvim" },
		{ "folke/lazydev.nvim" },
	},
	lazy = false,
	priority = 99,
	config = function()
		local cmp = require("cmp")
		local luasnip = require("luasnip")

		require("luasnip.loaders.from_vscode").lazy_load()

		cmp.setup({
			formatting = {
				fields = { "abbr", "kind", "icon", "menu" },
				format = require("lspkind").cmp_format({
					mode = "symbol", -- show only symbol annotations
					maxwidth = 50, -- Max before truncation
					ellipsis_char = "...", -- Truncation
				}),
			},
			sources = {
				{ name = "lazydev", group_index = 0 },
				{ name = "luasnip" },
				{ name = "nvim_lua" },
				{ name = "nvim_lsp" },
				{ name = "buffer" },
				{ name = "path" },
			},
			preselect = "item",
			completion = {
				completeopt = "menu,menuone,noinsert",
			},
			snippet = {
				expand = function(args)
					require("luasnip").lsp_expand(args.body)
				end,
			},
			mapping = cmp.mapping.preset.insert({
				["<CR>"] = cmp.mapping.confirm({ select = false }),
				["<C-Space>"] = cmp.mapping.complete(),
				["<C-u>"] = cmp.mapping.scroll_docs(-4),
				["<C-d>"] = cmp.mapping.scroll_docs(4),
				["<C-f>"] = cmp.mapping(function(fallback)
					if luasnip.jumpable(1) then
						luasnip.jump(1)
					else
						fallback()
					end
				end, { "i", "s" }),
				["<C-b>"] = cmp.mapping(function(fallback)
					if luasnip.jumpable(-1) then
						luasnip.jump(-1)
					else
						fallback()
					end
				end, { "i", "s" }),
				["<Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_next_item()
					elseif luasnip.expand_or_jumpable() then
						luasnip.expand_or_jump()
					else
						fallback()
					end
				end, { "i", "s" }),
				["<S-Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_prev_item()
					elseif luasnip.jumpable(-1) then
						luasnip.jump(-1)
					else
						fallback()
					end
				end, { "i", "s" }),
			}),
			window = {
				completion = cmp.config.window.bordered(),
				documentation = cmp.config.window.bordered(),
			},
		})
	end,
}
