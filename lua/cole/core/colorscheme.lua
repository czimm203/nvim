local status, _ = pcall(vim.cmd,"colorscheme tokyonight-storm")
if not status then
    print("Colorscheme not found")
    return
end
local function set_colors()
    vim.api.nvim_set_hl(0,"Normal", {bg = "none"})
    vim.api.nvim_set_hl(0,"NormalFloat", {bg = "none"})
end

set_colors()


