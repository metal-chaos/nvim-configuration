local api = vim.api

-- Copy path name
api.nvim_create_user_command("CpPath", function()
    local path = vim.fn.expand('%')
    vim.fn.setreg("+", path)
    vim.notify('Copied "' .. path .. '" to the clipboard!')
end, {})

-- Copy file name
api.nvim_create_user_command("CpFileName", function()
    local path = vim.fn.expand('%:t')
    vim.fn.setreg("+", path)
    vim.notify('Copied "' .. path .. '" to the clipboard!')
end, {})

-- Clipboard substitution
api.nvim_create_user_command("SubClipboard", function()
    local text = vim.fn.input("Input replacing text:")
    local clipboard = vim.fn.getreg('*')
    vim.fn.execute(':%s/' .. clipboard .. '/' .. text .. '/g')
    vim.notify('Substituted with "' .. text .. '"!')
end, {})

-- Store the cursor point at last
api.nvim_create_autocmd({"BufReadPost"}, {
    pattern = {"*"},
    callback = function() vim.api.nvim_exec('silent! normal! g`"zv', false) end
})
