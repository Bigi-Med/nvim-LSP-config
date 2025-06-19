local cmp = require 'cmp'
local lspkind = require 'lspkind'

cmp.setup({
    -- Enable snippet support
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body) -- Use LuaSnip to expand snippets
        end,
    },
    -- Key mappings for nvim-cmp
    mapping = {
        ['<Tab>'] = cmp.mapping.select_next_item(),
        ['<S-Tab>'] = cmp.mapping.select_prev_item(),
        ['<C-e>'] = cmp.mapping.close(),
        ['<C-Space>'] = cmp.mapping.confirm({ select = true }),
    },
    -- Define sources for completion
    sources = {
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
        { name = 'buffer' },
        { name = 'path' },
    },
    -- Formatting: Add icons using lspkind
    formatting = {
        format = lspkind.cmp_format({
            mode = 'symbol',       -- Use icons only (no text)
            maxwidth = 50,         -- Limit the width of the completion popup
            ellipsis_char = '...', -- Use ellipsis for long text
        })
    },
})
