return {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function ()
        require("catppuccin").setup({
            flavour = "mocha",
            transparent_background = false,
            show_end_of_buffer = false,
            integrations = {
                cmp = true,
                gitsigns = true,
                nvimtree = true,
                treesitter = true,
            }
        })

        vim.cmd([[colorscheme catppuccin]])
    end
}
