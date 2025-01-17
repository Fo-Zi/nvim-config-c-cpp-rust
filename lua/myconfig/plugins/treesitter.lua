-- Treesitter configuration
require('nvim-treesitter.configs').setup {
  ensure_installed = { "c", "cpp", "rust", "python", "lua" },
  highlight = { enable = true },
}
