require("nvim-treesitter.configs").setup({
    highlight = {
        enable = true
    },
    indent = {enable = true},
    autotag = {enable = true},
    ensure_installed = {
        "json",
        "javascript",
        "python",
        "rust",
        "yaml",
        "lua",
        "rust",
        "c",
        "cpp",
        "css",
        "svelte",
        "html",
        "css",
        "gitignore",
        "cmake"
    },
    auto_install = true,
})
