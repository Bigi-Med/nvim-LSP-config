vim.api.nvim_set_keymap('n', '<leader>gs', ':Git<CR>', { noremap = true, silent = true })        -- Open Git status
vim.api.nvim_set_keymap('n', '<leader>gc', ':Git commit<CR>', { noremap = true, silent = true }) -- Commit changes
vim.api.nvim_set_keymap('n', '<leader>gp', ':Git push<CR>', { noremap = true, silent = true })   -- Push changes
vim.api.nvim_set_keymap('n', '<leader>gl', ':Git pull<CR>', { noremap = true, silent = true })   -- Pull changes
vim.api.nvim_set_keymap('n', '<leader>gb', ':Git blame<CR>', { noremap = true, silent = true })  -- Blame
