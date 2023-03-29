require('phuc1nguyen.base')
require('phuc1nguyen.keymaps')
require('phuc1nguyen.plugins')

-- Load dracula theme
vim.cmd('packadd dracula')
vim.opt.background = 'dark'
vim.cmd('colorscheme dracula')

-- Configure coc.nvim
vim.cmd('autocmd FileType * lua require("config.coc")')

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
