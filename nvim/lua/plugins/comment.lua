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
            -- Disable default keymaps; we define our own below
            mappings = { basic = false, extra = false },
        })

        -- Normal mode: toggle current line
        vim.keymap.set("n", "<C-_>", "<Plug>(comment_toggle_linewise_current)", { desc = "Toggle comment" })
        vim.keymap.set("n", "<C-/>", "<Plug>(comment_toggle_linewise_current)", { desc = "Toggle comment" })

        -- Visual mode: toggle selected lines
        vim.keymap.set("x", "<C-_>", "<Plug>(comment_toggle_linewise_visual)", { desc = "Toggle comment" })
        vim.keymap.set("x", "<C-/>", "<Plug>(comment_toggle_linewise_visual)", { desc = "Toggle comment" })
    end,
}
