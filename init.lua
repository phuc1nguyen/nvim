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

-- Activate Tree Sitter modules
require('nvim-treesitter.configs').setup {
	ensure_installed = {"lua", "markdown", "javascript", "typescript"},
	sync_install = false,
	auto_install = true,
	ignore_install = {},
	highlight = {
		enable = true,
		disable = {},
		disable = function(lang, buf)
			local max_filesize = 100 * 1024 -- 100 KB
			local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
			if ok and stats and stats.size > max_filesize then
				return true
			end
		end,
		additional_vim_regex_highlighting = false,
	},
}

vim.g.mkdp_auto_start = 0
vim.g.mkdp_browser = 'cat'
vim.g.mkdp_echo_preview_url = 0
vim.g.mkdp_preview_options = {
   mkit = {},
   katex = {},
   uml = {},
   disable_sync_scroll = 0,
}
