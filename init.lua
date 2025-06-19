require("simo.remaps")
require("simo.set")

vim.api.nvim_create_autocmd({"BufReadPost", "BufNewFile"}, {
    callback = function()
        if vim.o.fileencoding == '' then
            vim.o.fileencoding = "utf-8"
        end
    end,
})
