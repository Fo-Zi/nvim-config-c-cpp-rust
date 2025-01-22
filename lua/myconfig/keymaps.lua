------------------- Key mappings -------------------
vim.g.mapleader = " "

------------------- General keybindings -------------------
----- vim-visual-multi configuration
vim.g.visual_multi_map_keys = { 
    -- Define your own keys for actions
    start_select = '<C-n>',  -- Start selection
    add_cursor = '<C-n>',    -- Add a cursor to selection
    remove_cursor = '<C-p>', -- Remove the last cursor
    select_all = '<C-a>',    -- Select all matches
}

-- Optional: Customize other visual-multi settings
vim.g.visual_multi_use_default_mapping = 1  -- Use default mappings

-- Commenting shortcuts:
-- <Space> + c
vim.api.nvim_set_keymap('n', '<Leader>cc', '<Plug>CommentaryLine', { noremap = true })
vim.api.nvim_set_keymap('x', '<Leader>c', '<Plug>Commentary', { noremap = true })
vim.api.nvim_set_keymap('v', '<Leader>c', '<Plug>Commentary', { noremap = true })

-- Find/search files
vim.api.nvim_set_keymap('n', '<Leader>ff', ':Telescope find_files<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>fg', ':Telescope live_grep<CR>', { noremap = true })

-- File explorer shorcuts:
-- <Space> + e -> Open/Minimize file explorer
vim.api.nvim_set_keymap('n', '<Leader>e', ':NvimTreeToggle<CR>', { noremap = true })
vim.api.nvim_set_keymap('x', '<C-V>', '<C-V>', { noremap = true, silent = true })
-- Terminal shortcut
-- <Space> + t -> Opens terminal in the bottom
vim.api.nvim_set_keymap('n', '<Leader>t', ':belowright 20 split | terminal<CR>', { noremap = true, silent = true })

-- Tab navigation shortcuts
-- <Shift> + l  -> Moves onto tab to the left
-- <Shift> + h  -> Moves onto tab to the right
vim.api.nvim_set_keymap('n', 'H', 'gT', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'L', 'gt', { noremap = true, silent = true })

-- Code linting and actions shortcuts
-- <Space> + ca -> Shows menu to pick code action to apply
-- <Space> + dd -> Shows diagnostics menu 
vim.api.nvim_set_keymap('n', '<Leader>dd', ':Telescope diagnostics<CR>', { noremap = true, silent = true })

-- Insert at cursor positions when in visual multi-mode
vim.api.nvim_set_keymap('x', 'I', '<Plug>(VM-Insert)', { noremap = true, silent = true })

-- Enable Ctrl+Left Arrow and Ctrl+Right Arrow to move to previous/next word
vim.api.nvim_set_keymap('i', '<C-Left>', '<Esc>bwi', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<C-Right>', '<Esc>wci', { noremap = true, silent = true })


vim.api.nvim_set_keymap('n', '<leader>sh', '<cmd>lua vim.lsp.buf.signature_help()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>sd', '<cmd>Telescope lsp_definitions<CR>', { noremap = true, silent = true })

vim.keymap.set('n', 'gd', function()
    require('telescope.builtin').lsp_definitions({ jump_type = 'tab' })
end, { noremap = true, silent = true })

vim.keymap.set('n', 'gD', function()
    require('telescope.builtin').lsp_declarations({ jump_type = 'tab' })
end, { noremap = true, silent = true })
