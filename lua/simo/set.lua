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
vim.opt.shiftwidth = 0
vim.opt.expandtab = true
vim.opt.wrap = true
vim.opt.clipboard = 'unnamedplus'

vim.opt.smartindent = true
vim.opt.virtualedit = "block"
vim.opt.inccommand = "split"

vim.opt.scrolloff = 999

vim.opt.swapfile = false

vim.opt.updatetime = 50

function setCursor()
    vim.api.nvim_set_hl(0,"CrusorReset",{fg='white',bg='white'})
end

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
