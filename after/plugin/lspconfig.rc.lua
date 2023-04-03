local status, lspconfig = pcall(require, 'lspconfig')
if (not status) then return end

local protocol = require('vim.lsp.protocol')
local custom_attach = function(client, bufnr)
  local nvim_command = vim.api.nvim_command

  if client.server_capabilities.documentFormattingProvider then
    nvim_command [[augroup Format]]
    nvim_command [[autocmd! * <buffer>]]
    nvim_command [[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_seq_sync()]]
    nvim_command [[augroup END]]
  end
end

lspconfig.tsserver.setup {
  on_attach = custom_attach,
  filetypes = {
    'javascript',
    'javascriptreact',
    'javascript.jsx',
    'typescript',
    'typescriptreact',
    'typescript.tsx'
  },
  cmd = { 'typescript-language-server', '--stdio' }
}

lspconfig.lua_ls.setup {
  on_attach = custom_attach,
  filetypes = { 'lua' },
  cmd = { 'lua-language-server' },
  settings = {
    diagnostics = {
      -- Get the language server to recognize the `vim` global
      globals = { 'vim' },
    },
    workspace = {
      -- Make the server aware of Neovim runtime files
      library = vim.api.nvim_get_runtime_file('', true),
    },
    -- Do not send telemetry data containing a randomized but unique identifier
    telemetry = {
      enable = false,
    },
  }
}
