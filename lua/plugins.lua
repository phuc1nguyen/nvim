require('packer').startup(function()
	-- Your plugin configurations will go here
	use 'wbthomason/packer.nvim'
	use { 'nvim-treesitter/nvim-treesitter' }
	use { 'dracula/vim' }
end)
