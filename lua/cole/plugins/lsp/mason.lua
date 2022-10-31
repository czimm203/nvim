require("mason").setup()

require('mason-lspconfig').setup({
    ensure_installed = {
        "tailwindcss",
        "html",
        "cssls",
        "sumneko_lua",
        "clangd",
        "tsserver",
        "pyright",
        "sqlls",
        "svelte",
        "rust_analyzer",
        "yamlls",
        "jsonls",
    }
})
