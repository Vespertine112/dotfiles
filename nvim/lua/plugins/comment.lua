-- Comment functionality
-- return {
-- 	"numToStr/Comment.nvim",
-- 	opts = {
-- 		toggler = { line = "", block = "gbc" },
-- 		opleader = { line = "" },
-- 	},
-- 	lazy = false,
-- }

return {
    "numToStr/Comment.nvim",
    lazy = false,
    config = function()
        require("Comment").setup({
            -- Remove toggler opts; we handle keymaps manually below
            opleader = { block = "gb" },
        })

        local api = require("Comment.api")

        -- Normal mode: toggle current line
        -- <C-_> = what Mac/Linux terminals send for Ctrl+/
        -- <C-/> = what Windows/kitty-protocol terminals send
        vim.keymap.set("n", "<C-_>", api.toggle.linewise.current, { desc = "Toggle comment" })
        vim.keymap.set("n", "<C-/>", api.toggle.linewise.current, { desc = "Toggle comment" })

    end,
}
