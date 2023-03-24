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
end)
