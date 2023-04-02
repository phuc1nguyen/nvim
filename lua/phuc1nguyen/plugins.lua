local status, packer = pcall(require, 'packer')

-- Define where Packer should be installed
local packer_path = vim.fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

-- Check if Packer is already installed
if (not status) then
  print('Installing packer...') -- Install Packer if it is not already installed
	vim.fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', packer_path})
	vim.api.nvim_command('packadd packer.nvim')
  return
end

require('packer').startup(function()
	use 'wbthomason/packer.nvim'  -- Package manager

  -- Themes
	use { 'dracula/vim', as = 'dracula' }
  use 'navarasu/onedark.nvim'

  use 'neovim/nvim-lspconfig' -- Configurations for Neovim LSP
	use 'nvim-treesitter/nvim-treesitter' -- Syntax highlighting
	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.1',
		requires = { {'nvim-lua/plenary.nvim'} }
	} -- Fuzzy finder
	use {
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v2.x",
		requires = { 
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
		}
	}  -- File explorer
	use {
		'nvim-lualine/lualine.nvim',
		requires = { 'kyazdani42/nvim-web-devicons', opt = true }
	} -- Status line
end)
