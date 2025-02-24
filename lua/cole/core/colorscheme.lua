local keymap = vim.keymap


local light = "colorscheme tokyonight-day"
local dark = "colorscheme tokyonight-storm"
local scheme = dark
local status, _ = pcall(vim.cmd, scheme)

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

local function swap_palette()
    if scheme == dark then
        vim.o.background = "light"
        scheme = light
    else
        vim.o.background = "dark"
        scheme = dark
    end

    status, _ = pcall(vim.cmd, scheme)
    if not status then
        print("Colorscheme not found")
        return
    end
end


keymap.set("n","<leader>tc", swap_palette)
