-- Setup nvim-autopairs
require('nvim-autopairs').setup({
    check_ts = true,                        -- Enable treesitter integration for more intelligent pairing
    ts_config = {
        lua = { "string" },                 -- Lua config to enable auto-pairs inside strings
        javascript = { "template_string" }, -- JavaScript template strings
        -- Add other languages as needed
    }
})
