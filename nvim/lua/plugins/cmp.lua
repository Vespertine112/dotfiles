return {
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    dependencies = {
        { 'L3MON4D3/LuaSnip' },
        { "hrsh7th/cmp-buffer" },
        { "hrsh7th/cmp-nvim-lua" },
        { "hrsh7th/cmp-nvim-lsp" },
        { 'hrsh7th/cmp-path' },
        { "rafamadriz/friendly-snippets" },
        { 'saadparwaiz1/cmp_luasnip' },
        { "onsails/lspkind.nvim" },
    },
    lazy = false,
    priority = 99,
    config = function()
        -- Here is where you configure the autocompletion settings.
        local lsp_zero = require('lsp-zero')
        lsp_zero.extend_cmp()

        -- And you can configure cmp even more, if you want to.
        local cmp = require('cmp')
        local cmp_action = lsp_zero.cmp_action()

        require('luasnip.loaders.from_vscode').lazy_load()

        cmp.setup({
            formatting = {
                fields = { 'abbr', 'kind', 'menu' },
                format = require('lspkind').cmp_format({
                    mode = 'symbol',       -- show only symbol annotations
                    maxwidth = 50,         -- Max before truncation
                    ellipsis_char = '...', -- Truncation
                }),
            },
            enabled = true,
            sources = {
                { name = 'luasnip' },
                { name = 'nvim_lua' },
                { name = 'nvim_lsp' },
                { name = 'buffer' },
                { name = 'path' },
            },
            preselect = 'item',
            completion = {
                completeopt = 'menu,menuone,noinsert'
            },
            snippet = {
                expand = function(args)
                    require('luasnip').lsp_expand(args.body)
                end,
            },
            mapping = cmp.mapping.preset.insert({
                ['<Tab>'] = cmp_action.luasnip_supertab(),
                ['<S-Tab>'] = cmp_action.luasnip_shift_supertab(),
                ['<CR>'] = cmp.mapping.confirm({ select = false }),
                ['<C-Space>'] = cmp.mapping.complete(),
                ['<C-u>'] = cmp.mapping.scroll_docs(-4),
                ['<C-d>'] = cmp.mapping.scroll_docs(4),
                ['<C-f>'] = cmp_action.luasnip_jump_forward(),
                ['<C-b>'] = cmp_action.luasnip_jump_backward(),
            }),
            window = {
                completion = cmp.config.window.bordered(),
                documentation = cmp.config.window.bordered(),
            },
        })
    end
}
