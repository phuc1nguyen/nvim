local status, treesitter = pcall(require, 'nvim-treesitter.config')
if (not status) then return end

-- Activate Tree Sitter modules
treesitter.setup {
  ensure_installed = { "lua", "markdown", "javascript", "typescript" },
  sync_install = false,
  auto_install = true,
  ignore_install = {},
  hightlight = {
    enable = true,
    -- disable = {},
    disable = function(lang, buf)
      local max_filesize = 100 * 1024 -- 100 kB
      local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
      if ok and stats and stats.size > max_filesize then
        return true
      end
    end,
    additional_vim_regex_highlighting = false,
  },
}
