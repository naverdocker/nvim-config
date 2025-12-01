-- settings.lua

-- UI & Appearance
vim.opt.termguicolors = true   -- Enable 24-bit RGB color
vim.opt.laststatus = 2         -- Always show statusline
vim.opt.showmode = true
vim.opt.relativenumber = true  -- Relative line numbers
vim.opt.number = true          -- Absolute line numbers
vim.opt.fillchars = { vert = '|' }

-- Text & Editing
vim.opt.spell = true
vim.opt.compatible = false
vim.opt.timeoutlen = 500

-- Indentation (4 spaces)
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true       -- Use spaces instead of tabs
vim.opt.autoindent = true
vim.opt.breakindent = true
vim.opt.showbreak = '>>'

-- Search
vim.opt.showmatch = true
vim.opt.hlsearch = false       -- No highlight on search by default
vim.opt.incsearch = true

-- System & File
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.splitbelow = true      -- New splits go down
vim.opt.splitright = true      -- New splits go right
vim.opt.path:append('**')      -- Recursive file finding
vim.opt.wildmenu = true

-- Clipboard (WSL support)
vim.g.clipboard = {
    name = "xclip-wsl",
    copy = {
        ["+"] = "xclip -i -selection clipboard"
    },
    paste = {
        ["+"] = "xclip -o -selection clipboard"
    },
    cache_enabled = 0,
}