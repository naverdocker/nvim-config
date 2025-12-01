-- keymaps.lua

-- Window Navigation (Ctrl + h/j/k/l)
vim.keymap.set('n', '<C-h>', '<C-w>h', { noremap = true, silent = true })
vim.keymap.set('n', '<C-j>', '<C-w>j', { noremap = true, silent = true })
vim.keymap.set('n', '<C-k>', '<C-w>k', { noremap = true, silent = true })
vim.keymap.set('n', '<C-l>', '<C-w>l', { noremap = true, silent = true })

-- Leader Key
vim.g.mapleader = ','

-- Basic File Operations
vim.keymap.set('n', '<leader>t', ':source ~/.config/nvim/init.lua<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>w', ':w<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>wa', ':wa<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>wqa', ':wqa<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>e', ':ex .<CR>', { noremap = true, silent = true })

-- View & Toggles
vim.keymap.set('n', '<leader>re', ':set relativenumber!<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>nre', ':set number!<BAR>:set relativenumber!<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>h', ':set hlsearch!<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>cc', ':set cuc!<CR>', { noremap = true, silent = true })

-- Buffer & Session
vim.keymap.set('n', '<leader>se', ':source session.vim<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>ss', ':mksession! session.vim<CR>', { noremap = true })
vim.keymap.set('n', '<leader>q', ':ls<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>bd', ':bdelete<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>n', ':bnext<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>b', ':bprev<CR>', { noremap = true, silent = true })

-- Utilities
vim.keymap.set('n', '<leader>dt', function()
  local date = os.date('%Y-%m-%dT%H:%M:%S')
  vim.api.nvim_put({ date }, 'c', true, true)
end, { noremap = true,silent = true })

vim.keymap.set('n', '<leader>sp', function()
    vim.opt.spell = not vim.opt.spell:get()
    print('Spell checking ' .. (vim.opt.spell:get() and 'enabled' or 'disabled'))
end, { noremap = true, silent = true })

-- Insert Mode Auto-pairing
vim.keymap.set('i', '<leader>"', '""<Left>', { noremap = true, silent = true })
vim.keymap.set('i', "<leader>'", "''<Left>", { noremap = true, silent = true })
vim.keymap.set('i', '<leader>(', '()<Left>', { noremap = true, silent = true })
vim.keymap.set('i', '<leader>{', '{}<Left>', { noremap = true, silent = true })
vim.keymap.set('i', '<leader>[', '[]<Left>', { noremap = true, silent = true })
vim.keymap.set('i', '<leader><CR>', '<CR><up><esc>A', { noremap = true, silent = true })

-- Toggle Line Comment
vim.keymap.set('n', '<leader>3', function()
    local lnum = vim.fn.line('.')
    local line = vim.fn.getline(lnum)

    if line:match('^%s*#%s?') then
        line = line:gsub('^%s*#', '', 1)
    else
        line = '#' .. line
    end

    vim.fn.setline(lnum, line)
end, { silent = true, desc = 'Toggle comment (normal)' })

-------------------
-- TMUX INTEGRATION
-------------------

-- Pane 1: Execute File (Bottom/Right)
-- Send current file path to bottom tmux pane
vim.keymap.set('n', '<leader>ww', function()
    vim.cmd('write')
    local file = vim.fn.expand('%:p')
    local name = vim.fn.expand('%:t')
    vim.fn.system('tmux send-keys -t bottom "' .. file .. '" Enter')
    print("▶ Sent to tmux bottom: " .. name)
end, { noremap = true, silent = true })

-- Clear bottom pane
vim.keymap.set('n', '<leader>wc', function()
    vim.fn.system('tmux send-keys -t bottom "clear" Enter')
    print("🧹 Cleared tmux bottom pane")
end, { noremap = true, silent = true })

-- Send current file path to right tmux pane
vim.keymap.set('n', '<leader>wr', function()
    vim.cmd('write')
    local file = vim.fn.expand('%:p')
    local name = vim.fn.expand('%:t')
    vim.fn.system('tmux send-keys -t right "' .. file .. '" Enter')
    print("▶ Sent to tmux right: " .. name)
end, { noremap = true, silent = true })

-- Clear right pane
vim.keymap.set('n', '<leader>rc', function()
    vim.fn.system('tmux send-keys -t right "clear" Enter')
    print("🧹 Cleared tmux right pane")
end, { noremap = true, silent = true })


-- Pane 2: Send Selection/Line
-- Send visual selection to bottom pane
vim.keymap.set("v", "<leader>v", function()
  vim.cmd('noau normal! "vy"')
  local text = vim.fn.getreg("v")
  vim.fn.system({"tmux", "send-keys", "-t", "{down-of}", text, "Enter"})
end, { desc = "Send selection to bottom tmux pane" })

-- Send current line to bottom pane
vim.keymap.set("n", "<leader>vv", function()
  local text = vim.api.nvim_get_current_line()
  vim.fn.system({"tmux", "send-keys", "-t", "{down-of}", text, "Enter"})
  print("Sent to tmux: " .. text)
end, { desc = "Send line to bottom tmux pane" })

-- Send visual selection to right pane
vim.keymap.set("v", "<leader>r", function()
  vim.cmd('noau normal! "vy"')
  local text = vim.fn.getreg("v")
  vim.fn.system({"tmux", "send-keys", "-t", "{right-of}", text, "Enter"})
end, { desc = "Send selection to right tmux pane" })

-- Send current line to right pane
vim.keymap.set("n", "<leader>rr", function()
  local text = vim.api.nvim_get_current_line()
  vim.fn.system({"tmux", "send-keys", "-t", "{right-of}", text, "Enter"})
end, { desc = "Send line to right tmux pane" })