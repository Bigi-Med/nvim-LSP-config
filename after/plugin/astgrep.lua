local function ast_grep(query)
    -- Build the command using your query. Adjust the command line if needed.
    local cmd = "ast-grep " .. vim.fn.shellescape(query)
    local output = vim.fn.system(cmd)

    if vim.v.shell_error ~= 0 then
        print("ast-grep error: " .. output)
        return
    end

    local items = {}
    -- Expecting ast-grep output in the format: filename:line:col:matched_text
    for line in output:gmatch("[^\n]+") do
        local filename, lnum, col, text = line:match("([^:]+):(%d+):(%d+):(.*)")
        if filename and lnum and col and text then
            table.insert(items, {
                filename = filename,
                lnum = tonumber(lnum),
                col = tonumber(col),
                text = vim.trim(text)
            })
        end
    end

    if vim.tbl_isempty(items) then
        print("No matches found")
        return
    end

    vim.fn.setqflist(items, "r")
    vim.cmd("copen")
end

-- Create a user command :AstGrep that takes one argument (the query)
vim.api.nvim_create_user_command("AstGrep", function(opts)
    ast_grep(opts.args)
end, { nargs = 1 })

