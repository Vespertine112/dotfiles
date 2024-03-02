return {
	"folke/todo-comments.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	lazy = false,
	opts = {},
	keys = {
		{
			"]t",
			function()
				require("todo-comments").jump_next({ keywords = { "ERROR", "WARNING", "TODO" } })
			end,
			{ desc = "Next error/warning todo comment" },
		},
		{
			"[t",
			function()
				require("todo-comments").jump_next({ keywords = { "ERROR", "WARNING", "TODO" } })
			end,
			{ desc = "Next error/warning todo comment" },
		},
	},
}

-- TODO: Something todo

-- HACK: Something hacky

-- PERF: This is optimized

-- NOTE: Notes here

-- FIX: Fix here

-- WARNING: WARNING!

-- COMMANDS:
-- :TodoQuickFix
-- :TodoLocList
-- :TodoTelescope
