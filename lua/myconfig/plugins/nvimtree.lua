-- NvimTree configuration
require'nvim-tree'.setup({
  auto_reload_on_write = true,
})

-- Optional settings
vim.g.nvim_tree_width = 30
vim.g.nvim_tree_side = 'left'
vim.g.nvim_tree_auto_open = 1
vim.g.nvim_tree_auto_close = 0
vim.g.nvim_tree_quit_on_open = 0

vim.cmd [[autocmd VimEnter * NvimTreeToggle]]
