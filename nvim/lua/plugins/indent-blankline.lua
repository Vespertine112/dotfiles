return {
	"lukas-reineke/indent-blankline.nvim",
	event = "VeryLazy",
	opts = {
		indent = {
			char = "│",
			tab_char = "│",
		},
		scope = { enabled = false },
		exclude = {
			filetypes = {
				"help",
				"alpha",
				"dashboard",
				"neo-tree",
				"lazy",
				"mason",
				"notify",
				"toggleterm",
				"lazyterm",
				"oil",
			},
		},
	},
	main = "ibl",
}
