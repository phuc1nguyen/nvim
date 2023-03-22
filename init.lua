-- Define where Packer should be installed
local packer_path = vim.fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

-- Check if Packer is already installed
if vim.fn.empty(vim.fn.glob(packer_path)) > 0 then
  -- Install Packer if it is not already installed
  vim.fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', packer_path})
  vim.api.nvim_command('packadd packer.nvim')
end

require('plugins')
