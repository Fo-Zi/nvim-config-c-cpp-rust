-- LSP configuration
require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = { "clangd" },
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

-- Diagnostic configuration to prevent window shifting
vim.diagnostic.config({
  virtual_text = {
    prefix = "",  -- Icon to show next to the diagnostic message
    spacing = 4,    -- Space between the icon and message
  },
  signs = true,      -- Show diagnostic signs in the gutter
  underline = true,  -- Underline the text under diagnostics
  update_in_insert = false, -- Avoid updates while in insert mode (for performance)
  float = {
    border = "rounded", -- Make the floating window rounded
    source = "always",  -- Always show source in floating window
    header = "",
    prefix = "",
  },
})

-- Define custom signs for diagnostics (these will be shown in the gutter)
vim.fn.sign_define("LspDiagnosticsSignError", { text = "✘", texthl = "DiagnosticError" })
vim.fn.sign_define("LspDiagnosticsSignWarning", { text = "▲", texthl = "DiagnosticWarning" })
vim.fn.sign_define("LspDiagnosticsSignInformation", { text = "ℹ️", texthl = "DiagnosticInformation" })
vim.fn.sign_define("LspDiagnosticsSignHint", { text = "💡", texthl = "DiagnosticHint" })
