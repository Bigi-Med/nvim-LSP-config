---@diagnostic disable: unused-local
local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
    local opts = { buffer = bufnr, remap = false }

    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
    vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
    vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
    vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
    vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
    vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end)

-- to learn how to use mason.nvim with lsp-zero
-- read this: https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/doc/md/guides/integrate-with-mason-nvim.md
require('mason').setup({})
require('mason-lspconfig').setup({
    ensure_installed = { 'rust_analyzer', 'eslint', 'ts_ls', 'ast_grep' },
    handlers = {
        lsp_zero.default_setup,
        lua_ls = function()
            local lua_opts = lsp_zero.nvim_lua_ls()
            require('lspconfig').lua_ls.setup(lua_opts)
        end,
        ts_ls = function()
            local util = require("lspconfig/util")
            require("lspconfig").ts_ls.setup({
                on_new_config = function(new_config, new_root_dir)
                    -- Look for a local ts_ls binary in node_modules/.bin
                    local ts_ls_local = util.path.join(new_root_dir, "node_modules", ".bin", "ts_ls")
                    if vim.fn.executable(ts_ls_local) == 1 then
                        new_config.cmd = { ts_ls_local, "--stdio" }
                    else
                        new_config.cmd = { "typescript-language-server", "--stdio" }
                    end
                end,
                init_options = {
                    hostInfo = "neovim",
                },
            })
        end,
        emmet_ls = function()
            require("lspconfig").emmet_ls.setup({
                filetypes = { "html", "javascriptreact", "typescriptreact", "css", "sass", "scss", "less" },
                init_options = {
                    html = {
                        options = {
                            -- Enable BEM-style abbreviations or other customizations if desired:
                            ["bem.enabled"] = true,
                        },
                    },
                },
            })
        end,
    }
})
local cmp = require('cmp')
local lspkind = require('lspkind')
require('luasnip.loaders.from_vscode').lazy_load()


local cmp_select = { behavior = cmp.SelectBehavior.Select }

cmp.setup({
    -- Enable snippet support using LuaSnip
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end,
    },
    mapping = cmp.mapping.preset.insert({
        -- Navigation and confirmation keys
        ['<S-Tab>']   = cmp.mapping.select_prev_item(cmp_select),
        ['<Tab>']     = cmp.mapping.select_next_item(cmp_select),
        ['<CR>']      = cmp.mapping.confirm({ select = true }),
        ['<C-e>']     = cmp.mapping.close(),
        -- You can choose either complete or confirm for <C-Space>; here we use complete:
        ['<C-Space>'] = cmp.mapping.complete(),
    }),
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'nvim_lua' }, -- lsp-zero provided source
        { name = 'luasnip', keyword_length = 2 },
        { name = 'buffer',  keyword_length = 3 },
        { name = 'path' },
    }),
    formatting = {
        format = lspkind.cmp_format({
            mode = 'symbol',       -- Show only icons
            maxwidth = 50,         -- Limit popup width
            ellipsis_char = '...', -- Truncate long entries
            -- If you want to disable details (like lsp-zero did), you can modify here:
            -- with a custom format function if needed.
        }),
    },
})
