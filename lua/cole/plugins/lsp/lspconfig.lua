local lspconfig_status, _ = pcall(require, "lspconfig")
if not lspconfig_status then
    print("lsp")
    return
end
local cmp_lspconfig_status, _ = pcall(require, "cmp_nvim_lsp")
if not cmp_lspconfig_status then
    print("cmp lsp")
    return
end
local keymap = vim.keymap
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  keymap.set('n', 'gh', vim.diagnostic.open_float, bufopts)
  keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  keymap.set('n', '<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
  keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
  keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  -- keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)
end

-- local on_attach = function(client, buffer)

local capabilities = require('cmp_nvim_lsp').default_capabilities()
-- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
require('lspconfig')['html'].setup {
    capabilities = capabilities,
    on_attach = on_attach
}
-- require('lspconfig')['jedi_language_server'].setup {
--     capabilities = capabilities,
--     on_attach = on_attach
-- }
require('lspconfig')['pyright'].setup {
    capabilities = capabilities,
    on_attach = on_attach
}
require('lspconfig')['svelte'].setup {
    capabilities = capabilities,
    on_attach = on_attach
}
require('lspconfig')['ts_ls'].setup {
    capabilities = capabilities,
    on_attach = on_attach
}
require('lspconfig')['tailwindcss'].setup {
    capabilities = capabilities,
    on_attach = on_attach
}
require('lspconfig')['clangd'].setup {
    capabilities = capabilities,
    on_attach = on_attach
}
require('lspconfig')['rust_analyzer'].setup {
    capabilities = capabilities,
    on_attach = on_attach
}
require('lspconfig')['cssls'].setup {
    capabilities = capabilities,
    on_attach = on_attach
}
require('lspconfig')['gopls'].setup {
    capabilities = capabilities,
    on_attach = on_attach
}
require('lspconfig')['svelte'].setup {
    capabilities = capabilities,
    on_attach = on_attach
}
require('lspconfig')['zls'].setup {
    capabilities = capabilities,
    on_attach = on_attach
}
require('lspconfig')['lua_ls'].setup({
    capabilities = capabilities,
    on_attach = on_attach,
    settings = {
        Lua = {
            diagnostics = {
                globals = {"vim"},
            },
            workspace = {
                library = {
                    [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                    [vim.fn.stdpath("config") .. "/lua"] = true,
                },
            },
        },
    },
})
