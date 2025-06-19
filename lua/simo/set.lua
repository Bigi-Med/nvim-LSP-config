vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.splitbelow = true --New horizontal windows on the bottom
vim.opt.splitright = true --New vertical windows on the left

vim.opt.wrap = false

--vim.opt.guicursor = ""
--vim.opt.guicursor = 'n-v-c:block-Cursor'

vim.opt.tabstop = 4 --Amount of spaces
vim.opt.softtabstop = 4
--Auto indent space
vim.opt.shiftwidth = 4
vim.opt.shiftwidth = 0
---
vim.opt.expandtab = true --Spaces instead of tabs

vim.opt.smartindent = true

vim.opt.scrolloff = 8
vim.opt.wrap = false --Disable line wraping  
vim.opt.clipboard = 'unnamedplus' --use system clipboard

vim.opt.virtualedit = "block" --For visual block mode, put cursor in places with no text
vim.opt.inccommand = "split" --Preview files changes in split window

vim.opt.scrolloff = 999 -- cursor in middle when scrolling up and down

vim.opt.swapfile = false
vim.opt.ignorecase = true --ignore case when executing vim commands

function setCursor()
    vim.api.nvim_set_hl(0,"CrusorReset",{fg='white',bg='white'})
end

vim.opt.updatetime = 50


