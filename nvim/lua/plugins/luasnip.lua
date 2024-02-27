return {
	"L3MON4D3/LuaSnip",
	version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
    config = function ()
        require("luasnip.loaders.from_vscode").load()
    end,
    dependencies = { "rafamadriz/friendly-snippets" },
}

