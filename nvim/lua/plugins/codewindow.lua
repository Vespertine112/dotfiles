return {
    'gorbit99/codewindow.nvim',
    config = function()
        local codewindow = require('codewindow')
        codewindow.setup({
            auto_enable = true,
            exclude_filetypes = {
                'help',
                'oil'
            },
            minimap_width = 12,
        })

        codewindow.apply_default_keybinds()
    end,
}

--<leader>mo - open the minimap
--<leader>mc - close the minimap
--<leader>mf - focus/unfocus the minimap
--<leader>mm - toggle the minimap
