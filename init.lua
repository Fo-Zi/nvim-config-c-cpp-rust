-- Main init file
vim.cmd [[packadd packer.nvim]]

-- Plugin manager setup (if using packer.nvim)
require('packer').startup(function(use)
  use 'nvim-telescope/telescope.nvim'
  use { 'nvim-lua/plenary.nvim' }
  -- Add your other plugins here
end)

-- Load base configuration
require("myconfig.init")
