require('null-ls').setup({
    sources = {
        -- Prettier for formatting (via prettierd)
        require('null-ls').builtins.formatting.prettierd,

        -- ESLint for diagnostics (JavaScript, TypeScript)
        require('null-ls').builtins.diagnostics.eslint,

        -- Python: Flake8 for diagnostics
        require('null-ls').builtins.diagnostics.flake8,

        -- Python: Black for formatting
        require('null-ls').builtins.formatting.black,
    },
    debounce = 150,
    save_after_format = true, -- Automatically save after formatting (optional)
})
-- Auto-format on save
vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.format({ async = false })]]
-- Optional: Key mappings for LSP features
vim.api.nvim_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', { noremap = true, silent = true })                 -- Show hover documentation
vim.api.nvim_set_keymap('n', '<leader>d', '<Cmd>lua vim.diagnostic.open_float()<CR>', { noremap = true, silent = true }) -- Show diagnostics at cursor
