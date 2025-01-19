local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<leader>gf', builtin.git_files, {})
vim.keymap.set("n", "<space>fb", ":Telescope file_browser<CR>")
vim.keymap.set("n", "<space>fB", ":Telescope file_browser path=%:p:h select_buffer=true<CR>")
vim.keymap.set('n', '<leader>ps', function()
    builtin.grep_string({ search = vim.fn.input("Seach > ") });
end)

require("telescope").setup({
    extensions = {
        file_browser = {
            theme = "ivy",       -- Use the dropdown theme for the file browser
            hijack_netrw = true, -- Replace netrw with Telescope file browser
            mappings = {
                ["i"] = {
                    -- Custom insert mode mappings
                    ["<C-w>"] = function() vim.cmd('normal vbd') end, -- Delete word in insert mode
                },
                ["n"] = {
                    -- Custom normal mode mappings
                    ["N"] = require("telescope").extensions.file_browser.actions.create, -- Create a new file
                    ["R"] = require("telescope").extensions.file_browser.actions.rename, -- Rename a file
                    ["D"] = require("telescope").extensions.file_browser.actions.remove, -- Delete a file
                },
            },
        },
    },
})

require("telescope").load_extension("file_browser")
