local status, lualine = pcall(require, 'lualine')
if (not status) then return end

lualine.setup {
  options = {
    icon_enabled = true,
    theme = 'dracula',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {}
  },
  sections = {
    lualine_a = {'branch'},
    lualine_b = {'filetype', 'diff', 'diagnostics'},
    lualine_c = {{
      'filename',
      file_status = true,
      path = 0
    }},
    lualine_x = {'encoding', 'fileformat'},
    lualine_y = {},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {{
      'filename',
      file_status = true,
      path = 1
    }},
    lualine_x = {'filetype', 'location'},
    lualine_y = {},
    lualine_z = {}
  },
}
