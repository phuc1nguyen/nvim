local builtin = require('telescope.builtin')
local g = vim.g
local keymap = vim.keymap

-- Remap keybinding for telescopee
g.mapleader = " "
keymap.set('n', '<leader>ff', builtin.find_files, {})
keymap.set('n', '<leader>fg', builtin.git_files, {})

-- Increment/decrement
keymap.set('n', '+', '<C-a>')
keymap.set('n', '-', '<C-x>')

-- Select all
keymap.set('n', '<C-a>', 'gg<S-v>G')

-- -- New tab
-- keymap.set('n', 'te', ':tabedit')
-- Split window
keymap.set('n', 'ss', ':split<Return><C-w>w')
keymap.set('n', 'sv', ':vsplit<Return><C-w>w')
-- Move window
keymap.set('n', '<leader>w', '<C-w>w')
keymap.set('n', '<leader>h', '<C-w>h')
keymap.set('n', '<leader>k', '<C-w>k')
keymap.set('n', '<leader>j', '<C-w>j')
keymap.set('n', '<leader>l', '<C-w>l')

-- -- Resize window
-- keymap.set('n', '<C-w><left>', '<C-w><')
-- keymap.set('n', '<C-w><right>', '<C-w>>')
-- keymap.set('n', '<C-w><up>', '<C-w>+')
-- keymap.set('n', '<C-w><down>', '<C-w>-')

-- Toggle Neotree
keymap.set('n', '<C-b>', ':Neotree toggle<Return>') -- Same as VSCode ^^
