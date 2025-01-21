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
  use 'mfussenegger/nvim-lint'             -- For linting
  use 'jose-elias-alvarez/null-ls.nvim'    -- Prettier support (null-ls is required for Prettier)
  use 'tpope/vim-surround'                 -- For surrounding manipulations
  use 'windwp/nvim-autopairs'              -- For auto-pairing
  use { 'nvim-telescope/telescope.nvim',requires = {'nvim-lua/plenary.nvim'} }
  use {'nvim-telescope/telescope-ui-select.nvim' }
  use {'mg979/vim-visual-multi',branch = 'master'}
  use 'L3MON4D3/LuaSnip'
  use {'hrsh7th/cmp-nvim-lsp-signature-help',  requires = { 'hrsh7th/nvim-cmp' }}
  use {'tzachar/fuzzy.nvim',requires = { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' },}
  use {'tzachar/cmp-fuzzy-buffer', requires = { 'hrsh7th/nvim-cmp', 'tzachar/fuzzy.nvim' },}
  use { 'rust-lang/rust.vim' }
  use { 'simrat39/rust-tools.nvim' }
end)
