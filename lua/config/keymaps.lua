-- Remap keybinding for telescopee
local builtin = require('telescope.builtin')
vim.g.mapleader = " "
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
