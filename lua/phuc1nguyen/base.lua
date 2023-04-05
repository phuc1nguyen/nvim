print('Hello from phuc1nguyen')
local opt = vim.opt
local g = vim.g

-- Display line relative number
opt.number = true
opt.relativenumber = false

-- Set tab width to 2
opt.tabstop = 2
opt.shiftwidth = 2

-- Set tab type to spaces
opt.expandtab = true

-- COQ completion configurations
g.coq_settings = {
  auto_start = 'shut-up',
  keymap = {
    recommended = false,
    jump_to_mark = "<c-q>"
  },
  display = {
    preview = {
      border = 'single'
    }
  }
}
