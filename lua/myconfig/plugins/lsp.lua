-- LSP configuration
require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = { "clangd" },
  ensure_installed = { "rust_analyzer" },  -- Ensure rust_analyzer is installed
})

local lspconfig = require('lspconfig')
lspconfig.clangd.setup({

  capabilities = require('cmp_nvim_lsp').default_capabilities(),

  on_attach = function(client, bufnr)
      -- Check if the LSP supports code actions
      if client.server_capabilities.codeActionProvider then
        print("Code Actions are supported")
      end
      vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', { noremap = true, silent = true })
  end,

})

lspconfig.rust_analyzer.setup({
  capabilities = require('cmp_nvim_lsp').default_capabilities(),

  on_attach = function(client, bufnr)
    -- Check if the LSP supports code actions
    if client.server_capabilities.codeActionProvider then
      print("Code Actions are supported")
    end
    -- Map key for code actions
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', { noremap = true, silent = true })
  end,
})

