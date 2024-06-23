-- EXAMPLE
local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
local servers = { "html", "cssls" }

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
  }
end

-- typescript
lspconfig.tsserver.setup {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
}

lspconfig.clangd.setup {
  on_attach = function (client, bufnr)
    client.server_capabilities_signatureHelpProvider = false
    cmd = { "clangd", "--background-index", "--header-insertion=iwyu", "--suggest-missing-includes" }
    root_dir = vim.loop.cwd()
    on_attach(client, bufnr)
  end,
  capabilities = capabilities,
}
