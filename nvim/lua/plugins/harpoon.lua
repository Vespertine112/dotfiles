-- Need to finish this configuration, not a priority rn. [https://github.com/ThePrimeagen/harpoon/tree/harpoon2?tab=readme-ov-file#-The-Solutions]
return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },
	build = function()
		local harpoon = require("harpoon")
		harpoon:setup()
	end,
	keys = {
		{"<leader>a", function() require("harpoon"):list():append() end},
		{"<C-e>", function() require("harpoon").ui:toggle_quick_menu(harpoon:list()) end}
	}
}
