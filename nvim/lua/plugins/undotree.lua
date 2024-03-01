-- Massively clutch. Force this not to lazy load & set high priority so it builds the tree as soon as files are opened
return {
	"mbbill/undotree",
	lazy = false,
	priority = 1000,
	keys = {
		{ "<leader>u", vim.cmd.UndotreeToggle, desc = "Toggle undo tree" },
	},
}
