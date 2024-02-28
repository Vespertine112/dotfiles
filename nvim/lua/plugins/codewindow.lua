return {
    'gorbit99/codewindow.nvim',
    config = function()
        local codewindow = require('codewindow')
        codewindow.setup({
            auto_enable = true,
            exclude_filetypes = {
                "help",
                "alpha",
                "dashboard",
                "neo-tree",
                "Trouble",
                "trouble",
                "lazy",
                "mason",
                "notify",
                "toggleterm",
                "lazyterm",
                "oil",
            },
            minimap_width = math.floor(vim.o.columns * 0.05),
        })

        codewindow.apply_default_keybinds()
    end,
}

--<leader>mo - open the minimap
--<leader>mc - close the minimap
--<leader>mf - focus/unfocus the minimap
--<leader>mm - toggle the minimap
