-- General settings

-- Make sure you have clipboard support enabled
vim.opt.clipboard = "unnamedplus"  -- This ensures that the unnamed register uses the system clipboard
vim.o.lazyredraw = true  -- Disable redraw while executing macros
vim.o.redrawtime = 1500  -- Time in milliseconds to redraw (increase if necessary)

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

-- Reserve space for the sign column to avoid window shifting
vim.opt.signcolumn = "yes:1"  -- Always show the sign column, even if there are no signs
