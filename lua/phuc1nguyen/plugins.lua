-- Define where Packer should be installed
local packer_path = vim.fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

-- Check if Packer is already installed
if vim.fn.empty(vim.fn.glob(packer_path)) > 0 then
	-- Install Packer if it is not already installed
	vim.fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', packer_path})
	vim.api.nvim_command('packadd packer.nvim')
end

require('packer').startup(function()
	use 'wbthomason/packer.nvim'
	use { 'neoclide/coc.nvim', branch = 'release' }
	use 'nvim-treesitter/nvim-treesitter'
	use { 'dracula/vim', as = 'dracula' }
	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.1',
		requires = { {'nvim-lua/plenary.nvim'} }
	}
	use {
		'iamcco/markdown-preview.nvim',
		run = 'cd app && yarn install',
		ft = 'markdown',
	}
	use {
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v2.x",
		requires = { 
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
		}
	}
	use {
		'nvim-lualine/lualine.nvim',
		requires = { 'kyazdani42/nvim-web-devicons', opt = true }
	}
end)
