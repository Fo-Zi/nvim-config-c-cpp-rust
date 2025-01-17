-- General settings
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.termguicolors = true
vim.o.number = true
vim.o.syntax = 'enable'
vim.o.wrap = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.softtabstop = 4
vim.o.expandtab = true
vim.cmd 'filetype plugin indent on'

-- Colorscheme setup
require('onedark').setup { style = 'darker' }
require('onedark').load()
