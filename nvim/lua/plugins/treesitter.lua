-- Treesitter config. Add languages below for indent & highlighting support
local M = {
	"nvim-treesitter/nvim-treesitter",
	config = function()
		local configs = require("nvim-treesitter.configs")

		configs.setup({
			ensure_installed = {
				"c",
				"lua",
				"vim",
				"vimdoc",
				"query",
				"elixir",
				"heex",
				"typescript",
				"javascript",
				"html",
				"svelte",
			},
			sync_install = false,
			highlight = { enable = true },
			indent = { enable = disable },

			auto_install = true,
		})
	end,
	build = function()
		require("nvim-treesitter.install").update({ with_sync = true })()
	end,
}

return { M }
