local builtin = require('telescope.builtin')
local g = vim.g
local map = vim.keymap

-- Remap keybinding for telescopee
g.mapleader = " "
map.set('n', '<leader>ff', builtin.find_files, {})
map.set('n', '<leader>fg', builtin.git_files, {})

-- Increment/decrement
map.set('n', '+', '<C-a>')
map.set('n', '-', '<C-x>')

-- Select all
map.set('n', '<C-a>', 'gg<S-v>G')

-- Split window
map.set('n', 'ss', ':split<Return><C-w>w')
map.set('n', 'sv', ':vsplit<Return><C-w>w')

-- Move window
-- map.set('n', '<leader>w', '<C-w>w')
map.set('n', '<leader>h', '<C-w>h')
map.set('n', '<leader>k', '<C-w>k')
map.set('n', '<leader>j', '<C-w>j')
map.set('n', '<leader>l', '<C-w>l')

-- Resize window
map.set('n', '<C-w><left>', '<C-w><')
map.set('n', '<C-w><right>', '<C-w>>')
map.set('n', '<C-w><up>', '<C-w>+')
map.set('n', '<C-w><down>', '<C-w>-')

-- Navigate tabs
map.set('n', '<leader>1', '1gt')
map.set('n', '<leader>2', '2gt')
map.set('n', '<leader>3', '3gt')
map.set('n', '<leader>4', '4gt')
map.set('n', '<leader>5', '5gt')
map.set('n', '<leader>6', '6gt')
map.set('n', '<leader>7', '7gt')
map.set('n', '<leader>8', '8gt')
map.set('n', '<leader>9', '9gt')
map.set('n', '<leader>0', ':tablast<Return>')

-- Toggle Neotree
map.set('n', '<C-b>', ':Neotree toggle<Return>') -- Same as VSCode ^^
