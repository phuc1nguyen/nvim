local ok, lspconfig = pcall(require, 'lspconfig')
if not ok then return end

local map = vim.keymap
local protocol = require('vim.lsp.protocol')

local on_attach = function(client, bufnr)
  local nvim_command = vim.api.nvim_command

  if client.server_capabilities.documentFormattingProvider then
    nvim_command [[augroup Format]]
    nvim_command [[autocmd! * <buffer>]]
    nvim_command [[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_seq_sync()]]
    nvim_command [[augroup END]]
  end
end

lspconfig.pyright.setup {
  on_attach = on_attach,
  filetypes = { 'python' },
  cmd = { 'pyright-langserver', '--stdio' },
  settings = {
    analysis = {
      autoSearchPaths = true,
      diagnosticMode = 'workspace',
      useLibraryCodeForTypes = true
    }
  }
}

lspconfig.tsserver.setup {
  on_attach = on_attach,
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
  on_attach = on_attach,
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

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf }
    map.set('n', 'gD', vim.lsp.buf.declaration, opts)
    map.set('n', 'gd', vim.lsp.buf.definition, opts)
    map.set('n', 'K', vim.lsp.buf.hover, opts)
    map.set('n', 'gi', vim.lsp.buf.implementation, opts)
    map.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
    map.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
    map.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
    map.set('n', '<space>wl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)
    map.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
    map.set('n', '<space>rn', vim.lsp.buf.rename, opts)
    map.set('n', '<space>ca', vim.lsp.buf.code_action, opts)
    map.set('n', 'gr', vim.lsp.buf.references, opts)
    map.set('n', '<space>f', function()
      vim.lsp.buf.format { async = true }
    end, opts)
  end,
})
