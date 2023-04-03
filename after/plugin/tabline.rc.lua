local status, tabline = pcall(require, 'tabline')
if (not status) then return end

tabline.setup {
  show_index = true,        -- show tab index
  show_icon = false,        -- show file extension icon
  show_modify = true,       -- show buffer modification indicator
  modify_indicator = '[+]', -- modify indicator
  no_name = 'No name',      -- no name buffer name
  brackets = { '[', ']' },  -- file name brackets surrounding
}
