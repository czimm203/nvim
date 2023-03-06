local status, _ = pcall(vim.cmd,"colorscheme gruvbox")
if not status then
    print("Colorscheme not found")
    return
end
local function set_colors()
    vim.api.nvim_set_hl(0,"Normal", {bg = "none", sp = "none"})
    vim.api.nvim_set_hl(0,"NormalFloat", {bg = "none", sp="none"})
    vim.api.nvim_set_hl(0,"SignColumn", {bg = "none", sp="none"})
    vim.api.nvim_set_hl(0,"CursorLine", {bg = "none", sp="none"})
end

set_colors()

