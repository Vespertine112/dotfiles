-- Some pre-configed snippets for common langs
return {
	"rafamadriz/friendly-snippets",
	config = function()
		require("luasnip.loaders.from_vscode").lazy_load()
	end,
}
