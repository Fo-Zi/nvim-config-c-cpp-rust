-- Start packer.nvim
require('packer').startup(function(use)
  use 'navarasu/onedark.nvim'
  use 'tpope/vim-sensible'
  use 'kyazdani42/nvim-tree.lua'
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
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
