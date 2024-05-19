vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Highlight when yanking (copying) text",
    group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
    callback = function()
        vim.highlight.on_yank()
    end,
})
vim.api.nvim_create_autocmd("BufWritePre", {
    desc = "Trim trailing whitespace on save",
    group = vim.api.nvim_create_augroup("trim-whitespace", { clear = true }),
    pattern = "*",
    callback = function()
        vim.cmd([[%s/\s\+$//e]])
    end,
})
vim.api.nvim_create_autocmd("BufWritePre", {
    desc = "Create non existing directories if needed",
    group = vim.api.nvim_create_augroup("make-directories-p", { clear = true }),
    pattern = "*",
    callback = function(event)
        local workspaceFilePath = event.file
        local dirname = vim.fs.dirname(workspaceFilePath)
        -- create a file directory/ies if not already exists
        if 0 == vim.fn.isdirectory(dirname) then
            vim.fn.mkdir(dirname, "p")
        end
    end,
})

