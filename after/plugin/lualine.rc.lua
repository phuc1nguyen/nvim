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
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {{
      'filename',
      file_status = true,
      path = 0 -- 0: just filename, 1: relative path, 2: absolute path
    }},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {{
      'filename',
      file_status = true,
      path = 1 -- 0: just filename, 1: relative path, 2: absolute path
    }},
    lualine_x = {'filetype', 'location'},
    lualine_y = {},
    lualine_z = {}
  }
}
