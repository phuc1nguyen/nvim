local ok, builtin = pcall(require, 'telescope.builtin')

if not ok then 
  print('Telescope is not ok')
  return
end

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

-- Split window
keymap.set('n', 'ss', ':split<Return><C-w>w')
keymap.set('n', 'sv', ':vsplit<Return><C-w>w')

-- Move window
-- keymap.set('n', '<leader>w', '<C-w>w')
keymap.set('n', '<leader>h', '<C-w>h')
keymap.set('n', '<leader>k', '<C-w>k')
keymap.set('n', '<leader>j', '<C-w>j')
keymap.set('n', '<leader>l', '<C-w>l')

-- Resize window
keymap.set('n', '<C-w><left>', '<C-w><')
keymap.set('n', '<C-w><right>', '<C-w>>')
keymap.set('n', '<C-w><up>', '<C-w>+')
keymap.set('n', '<C-w><down>', '<C-w>-')

-- Navigate tabs
keymap.set('n', '<leader>1', '1gt')
keymap.set('n', '<leader>2', '2gt')
keymap.set('n', '<leader>3', '3gt')
keymap.set('n', '<leader>4', '4gt')
keymap.set('n', '<leader>5', '5gt')
keymap.set('n', '<leader>6', '6gt')
keymap.set('n', '<leader>7', '7gt')
keymap.set('n', '<leader>8', '8gt')
keymap.set('n', '<leader>9', '9gt')
keymap.set('n', '<leader>0', ':tablast<Return>')

-- Toggle Neotree
keymap.set('n', '<C-b>', ':Neotree toggle<Return>') -- Same as VSCode ^^
