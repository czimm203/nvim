local status, _ = pcall(vim.cmd,"colorscheme tokyonight-storm")
if not status then
    print("Colorscheme not found")
    return
end

vim.cmd("highlight Normal guibg=None")
vim.cmd("highlight NonText guibg=None")
