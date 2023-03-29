require('phuc1nguyen.base')
require('phuc1nguyen.keymaps')
require('phuc1nguyen.plugins')

-- Load dracula theme
vim.cmd('packadd dracula')
vim.opt.background = 'dark'
vim.cmd('colorscheme dracula')

-- Configure coc.nvim
vim.cmd('autocmd FileType * lua require("config.coc")')
