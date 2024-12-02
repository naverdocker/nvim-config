-- highlights.lua

local M = {}

function M.default_apply()
    vim.api.nvim_set_hl(0, "MsgArea", { fg = "#c0c0c0" })
    vim.api.nvim_set_hl(0, "StatusLine", { fg = "#c0c0c0", bg = "#1e1e1e", bold = true })
    vim.api.nvim_set_hl(0, "StatusLineNC", { fg = "#707070", bg = "#1e1e1e" })
end

return M
