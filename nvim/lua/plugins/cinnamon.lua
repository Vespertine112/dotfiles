return {
    'declancm/cinnamon.nvim',
    config = function()
        require('cinnamon').setup({
            extra_keymaps = true,
            extended_keymaps = true,
            horizontal_scroll = true,
        })
    end,
}
