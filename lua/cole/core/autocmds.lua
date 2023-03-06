local api = vim.api

api.nvim_create_autocmd(
    "FileType",
    {pattern = {"typescript","javascript","html","svelte"}, command = "setlocal et ts=2 sw=2 sts=2"}
)
