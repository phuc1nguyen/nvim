local ok, treesitter = pcall(require, 'nvim-treesitter.configs')
if not ok then return end

-- Activate Treesitter modules
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
  autotag = {
    enable = true,
    filetypes = { 'html', 'javascript', 'typescript', 'javascriptreact', 'typescriptreact', 'markdown' }
  } -- Treesitter setup for autotags
}

-- Treesittere setup for checking for a pair
local npairs = require("nvim-autopairs")
local Rule = require('nvim-autopairs.rule')

npairs.setup({
  check_ts = true,
  ts_config = {
    lua = { 'string' }, -- it will not add a pair on that treesitter node
    javascript = { 'template_string' },
  }
})

local ts_conds = require('nvim-autopairs.ts-conds')

-- press % => %% only while inside a comment or string
npairs.add_rules({
  Rule("%", "%", "lua")
      :with_pair(ts_conds.is_ts_node({ 'string', 'comment' })),
  Rule("$", "$", "lua")
      :with_pair(ts_conds.is_not_ts_node({ 'function' }))
})
