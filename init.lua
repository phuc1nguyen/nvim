-- Define where Packer should be installed
local packer_path = vim.fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

-- Check if Packer is already installed
if vim.fn.empty(vim.fn.glob(packer_path)) > 0 then
	-- Install Packer if it is not already installed
	vim.fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', packer_path})
	vim.api.nvim_command('packadd packer.nvim')
end

require('plugins')

-- Load dracula theme
vim.cmd('packadd dracula')
vim.opt.background = 'dark'
vim.cmd('colorscheme dracula')
-- Display line relative number
vim.opt.number = true
vim.opt.relativenumber = true
-- Enable syntax highlighting
vim.cmd('syntax on')
-- Configure coc.nvim
vim.cmd('autocmd FileType * lua require("configs.coc")')
-- Remap keybinding for Telescope
local builtin = require('telescope.builtin')
vim.g.mapleader = " "
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
