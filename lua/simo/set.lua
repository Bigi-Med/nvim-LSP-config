vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.guicursor = ""
vim.opt.guicursor = 'n-v-c:block-Cursor'

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.scrolloff = 8

vim.opt.updatetime = 50

function setCursor()
    vim.api.nvim_set_hl(0,"CrusorReset",{fg='white',bg='white'})
end
