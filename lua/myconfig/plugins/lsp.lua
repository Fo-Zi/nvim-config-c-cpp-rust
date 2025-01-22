-- LSP configuration
require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = { "clangd" },
  ensure_installed = { "rust_analyzer" },  -- Ensure rust_analyzer is installed
})

-- Function to parse the query driver from the environment ->
local function get_clangd_query_driver()
    local query_driver = os.getenv("CLANGD_QUERY_DRIVER")
    if query_driver and #query_driver > 0 then
        return query_driver
    else
        return "clang++"
    end
end

local capabilities = require('cmp_nvim_lsp').default_capabilities()
require('lspconfig').clangd.setup {
    
  -- Config variables ->
  capabilities = capabilities,
  cmd = { 
      "clangd",  -- Set your preferred clangd binary here
      "--query-driver=**",
      "--background-index",
      "--clang-tidy", 
      "--header-insertion-decorators",
      "--header-insertion=iwyu",
      "--completion-style=detailed", 
      "--pch-storage=memory",     -- Store precompiled headers in memory
      "--limit-results=200",     -- Limit the number of results
  },
  init_options = {
    usePlaceholders = true,
    completeUnimported = true,
    clangdFileStatus = true,
    semanticHighlighting = true
  },
  flags = { debounce_text_changes = 150 }
 
  -- Command shortcut for quick code fix ->
  -- <Lead>ca -> Pops up a menu with suggested fixes
  on_attach = function(client, bufnr)
      -- Check if the LSP supports code actions
      if client.server_capabilities.codeActionProvider then
        print("Code Actions are supported")
      end
      vim.api.nvim_buf_set_keymap(bufnr, 'n', '<Lead>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', { noremap = true, silent = true })
  end,

}

require'lspconfig'.rust_analyzer.setup{}
