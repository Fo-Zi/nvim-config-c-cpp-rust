-- NvimTree configuration
-- require'nvim-tree'.setup({
--   auto_reload_on_write = true,
-- })

require('nvim-tree').setup({
  on_attach = function(bufnr)
    local api = require('nvim-tree.api')

    -- Helper function to set keymaps
    local function opts(desc)
      return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
    end

    -- Keybinding to open a file in a new tab
    vim.keymap.set('n', 't', api.node.open.tab, opts('Open File in New Tab'))

    -- Add other mappings as needed, e.g.:
    vim.keymap.set('n', '<CR>', api.node.open.edit, opts('Open File'))
    vim.keymap.set('n', 'R', api.tree.reload, opts('Refresh Tree'))
  end,

  sync_root_with_cwd = true,
  respect_buf_cwd = true,
  
  view = {
    adaptive_size = true, -- Adjusts the tree size based on the window
  },
  
  actions = {
    open_file = {
      resize_window = true, -- Ensures the tree stays consistent across tabs
    },
  },

})

-- Optional settings
vim.g.nvim_tree_width = 30
vim.g.nvim_tree_side = 'left'
vim.g.nvim_tree_auto_open = 1
vim.g.nvim_tree_auto_close = 0
vim.g.nvim_tree_quit_on_open = 0

vim.cmd [[autocmd VimEnter * NvimTreeToggle]]
