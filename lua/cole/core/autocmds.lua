local api = vim.api

api.nvim_create_autocmd(
    "FileType",
    {pattern = {"typescript","javascript","html","svelte", "css"}, command = "setlocal et ts=2 sw=2 sts=2"}
)

api.nvim_create_autocmd(
    "FileType",
    {pattern = "markdown", command = "setlocal wrap tw=80"}
)
