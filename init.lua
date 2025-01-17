-- Ensure packer is installed
vim.cmd [[packadd packer.nvim]]

-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.termguicolors = true

-- Start plugin manager (packer.nvim)
require('packer').startup(function(use)
  -- Add plugins here
  use 'navarasu/onedark.nvim'
  use 'tpope/vim-sensible'
  use 'kyazdani42/nvim-tree.lua' -- NvimTree plugin
  use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
  use 'tpope/vim-commentary'
  use 'dcampos/nvim-snippy'
  use 'honza/vim-snippets'
  use 'tpope/vim-fugitive'

  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'neovim/nvim-lspconfig'
  use 'folke/trouble.nvim'
end)

-- Set general configurations
vim.o.number = true              -- Enable line numbers
vim.o.syntax = 'enable'          -- Enable syntax highlighting
vim.o.wrap = true                -- Enable line wrapping
vim.o.tabstop = 4                -- Set tabstop to 4 spaces
vim.o.shiftwidth = 4             -- Set shiftwidth to 4 spaces
vim.o.softtabstop = 4            -- Set softtabstop to 4 spaces
vim.o.expandtab = true           -- Use spaces instead of tabs
vim.cmd 'filetype plugin indent on' -- Enable filetype plugins

-- Configure nvim-tree.lua
require'nvim-tree'.setup()

-- Set colorscheme after the plugin manager has loaded the theme
require('onedark').load()
require('onedark').setup {
    style = 'darker'
}
require('onedark').load()

-- Enable Treesitter
require'nvim-treesitter.configs'.setup {
  ensure_installed = { "c","cpp", "rust", "python", "lua" },
  highlight = {
    enable = true,
  },
}
-- Mason setup to manage language servers
require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = { "clangd" }, -- Install clangd automatically
})

-- Configure LSP servers for C/C++
local lspconfig = require('lspconfig')

-- clangd for C/C++
lspconfig.clangd.setup({
  capabilities = require('cmp_nvim_lsp').default_capabilities(),  -- nvim-cmp capabilities
  on_attach = function(client, bufnr)
    -- Additional setup (e.g., enable completion, keymaps, etc.)
  end
})

-- Trouble.nvim setup
require('trouble').setup({
  -- Configure your preferences here, e.g., position, icons, etc.
  position = "bottom", -- can be 'top' or 'bottom'
  height = 10, -- height of the trouble window
})

-- Snippet setup
vim.g.snippy_snippet_filetypes = {'c','cpp', 'rust', 'python', 'lua'}

-- Key mappings for copy and paste in insert mode
vim.api.nvim_set_keymap('i', '<C-c>', '<Esc>"+y', { noremap = true })
vim.api.nvim_set_keymap('i', '<C-v>', '<Esc>"+p', { noremap = true })

-- Set leader key to space
vim.g.mapleader = " "

-- Normal mode: Comment a single line
vim.api.nvim_set_keymap('n', '<Leader>c', '<Plug>CommentaryLine', { noremap = true })

-- Visual mode: Comment selected lines
vim.api.nvim_set_keymap('x', '<Leader>c', '<Plug>Commentary', { noremap = true })

-- Telescope keybindings for file search
vim.api.nvim_set_keymap('n', '<Leader>ff', ':Telescope find_files<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>fg', ':Telescope live_grep<CR>', { noremap = true })

-- Enable NvimTree
vim.cmd [[autocmd VimEnter * NvimTreeToggle]]

-- Keybinding to open NvimTree (toggle on/off)
vim.api.nvim_set_keymap('n', '<Leader>e', ':NvimTreeToggle<CR>', { noremap = true })

-- Keybinding to open a file in a new tab
vim.api.nvim_set_keymap('n', '<Leader>t', ':tabnew <C-R>=expand("<cfile>")<CR><CR>', { noremap = true, silent = true })

-- Open terminal at the bottom with 30% of the height
vim.api.nvim_set_keymap('n', '<Leader>t', ':belowright 30 split | terminal<CR>', { noremap = true, silent = true })

-- Optional: Set the width of the explorer window
vim.g.nvim_tree_width = 30

-- Optional: Set the position of the explorer (left/right)
vim.g.nvim_tree_side = 'left'

-- Optional: Keep the tree open when opening files
vim.g.nvim_tree_auto_open = 1
vim.g.nvim_tree_auto_close = 0
vim.g.nvim_tree_quit_on_open = 0

