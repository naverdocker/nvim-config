-- autocmds.lua
-- This file defines autocmds that trigger on specific Neovim events.

-- Automatically save view (folds, cursor position, etc.) when leaving a buffer.
vim.api.nvim_create_autocmd("BufWinLeave", {
    pattern = "*",
    callback = function()
        if vim.fn.empty(vim.fn.expand("%")) == 0 then
            vim.cmd("silent! mkview")
        end
    end,
})

-- Automatically load view when entering a buffer.
vim.api.nvim_create_autocmd("BufWinEnter", {
    pattern = "*",
    callback = function()
        if vim.fn.empty(vim.fn.expand("%")) == 0 and vim.fn.filereadable(vim.fn.expand("%:p")) == 1 then
            vim.cmd("silent! loadview")
        end
    end,
})

-- Highlight text temporarily after yanking
vim.api.nvim_create_autocmd('TextYankPost', {
    callback = function()
        vim.highlight.on_yank({ higroup = 'Visual', timeout = 250 })
    end
})

-- Remove trailing whitespace before saving a file.
vim.api.nvim_create_autocmd('BufWritePre', {
    pattern = '*',
    command = '%s/\\s\\+$//e',
})

-- On buffer entry, adjust formatoptions to prevent automatic comment insertion.
vim.api.nvim_create_autocmd("BufEnter", {
    pattern = "*",
    callback = function()
        vim.opt.formatoptions:remove("r")
        vim.opt.formatoptions:remove("o")
    end,
})

