-- LSP configuration
require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = { "clangd" },
})

local lspconfig = require('lspconfig')
lspconfig.clangd.setup({
  capabilities = require('cmp_nvim_lsp').default_capabilities(),
  on_attach = function(client, bufnr)
    -- Additional setup for LSP
  end,
})
