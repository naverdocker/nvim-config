-- keymaps.lua

vim.keymap.set('n', '<C-h>', '<C-w>h', { noremap = true, silent = true })
vim.keymap.set('n', '<C-j>', '<C-w>j', { noremap = true, silent = true })
vim.keymap.set('n', '<C-k>', '<C-w>k', { noremap = true, silent = true })
vim.keymap.set('n', '<C-l>', '<C-w>l', { noremap = true, silent = true })

--setting leader key
vim.g.mapleader = ','

vim.keymap.set('n', '<leader>r', ':source ~/.config/nvim/init.lua<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>w', ':w<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>wa', ':wa<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>wqa', ':wqa<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>e', ':ex .<CR>', { noremap = true, silent = true })

vim.keymap.set('n', '<leader>re', ':set relativenumber!<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>nre', ':set number!<BAR>:set relativenumber!<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>h', ':set hlsearch!<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>cc', ':set cuc!<CR>', { noremap = true, silent = true })

vim.keymap.set('n', '<leader>se', ':source session.vim<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>ss', ':mksession! session.vim<CR>', { noremap = true })
vim.keymap.set('n', '<leader>q', ':ls<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>n', ':bnext<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>b', ':bprev<CR>', { noremap = true, silent = true })
