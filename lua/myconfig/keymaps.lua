------------------- Key mappings -------------------
vim.g.mapleader = " "

------------------- General keybindings -------------------
-- Ctrl + C && Ctrl + y
vim.api.nvim_set_keymap('i', '<C-c>', '<Esc>"+y', { noremap = true })
vim.api.nvim_set_keymap('i', '<C-v>', '<Esc>"+p', { noremap = true })

-- Commenting shortcuts:
-- <Space> + c
vim.api.nvim_set_keymap('n', '<Leader>c', '<Plug>CommentaryLine', { noremap = true })
vim.api.nvim_set_keymap('x', '<Leader>c', '<Plug>Commentary', { noremap = true })

-- Find/search files
vim.api.nvim_set_keymap('n', '<Leader>ff', ':Telescope find_files<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>fg', ':Telescope live_grep<CR>', { noremap = true })

-- File explorer shorcuts:
-- <Space> + e -> Open/Minimize file explorer
vim.api.nvim_set_keymap('n', '<Leader>e', ':NvimTreeToggle<CR>', { noremap = true })

-- Terminal shortcut
-- <Space> + t -> Opens terminal in the bottom
vim.api.nvim_set_keymap('n', '<Leader>t', ':belowright 30 split | terminal<CR>', { noremap = true, silent = true })
