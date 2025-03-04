function _G.get_clipboard_content()
    local clipboard = vim.fn.system('powershell.exe -command "Get-Clipboard"')
    clipboard = clipboard:gsub("%s+$", "")
    local lines = vim.split(clipboard, "\n")
    vim.api.nvim_put(lines, 'c', true, true)
    print("Pasting from windows clipboard!")
end

function _G.copy_visual()
    -- Get the start and end positions of the visual selection.
    local start_pos = vim.fn.getpos("'<")
    local end_pos = vim.fn.getpos("'>")
    local start_line = start_pos[2]
    local start_col = start_pos[3]
    local end_line = end_pos[2]
    local end_col = end_pos[3]

    -- Get the lines from the buffer for the selection.
    local lines = vim.api.nvim_buf_get_lines(0, start_line - 1, end_line, false)
    if #lines == 0 then
        return
    end

    -- Adjust the first and last line to capture only the selected text.
    if #lines == 1 then
        lines[1] = string.sub(lines[1], start_col, end_col)
    else
        lines[1] = string.sub(lines[1], start_col)
        lines[#lines] = string.sub(lines[#lines], 1, end_col)
    end

    -- Combine the lines into one string
    local text = table.concat(lines, "\n")
    -- Copy the text to Windows clipboard using clip.exe
    vim.fn.system("clip.exe", text)
    print("Copied to Windows clipboard!")
end

vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.api.nvim_set_keymap('v', '<leader>y', ':lua copy_visual()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>p', ':lua print(get_clipboard_content())<CR>', { noremap = true, silent = true })
