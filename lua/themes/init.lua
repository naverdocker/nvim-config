-- themes/init.lua

-- habamax -- retrobox -- wildcharm

local active_theme  = "wildcharm"
local default_highlights  = true

local ok, _ = pcall(require, "themes." .. active_theme)

if not ok then
    vim.cmd("colorscheme " .. active_theme)
end

if default_highlights then
    require('highlights').default_apply()
end
