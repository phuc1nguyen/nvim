local ok, neotree = pcall(require, 'neo-tree')  
if not ok then return end

neotree.setup {
  close_if_last_window = true,  -- Close Neotree if it is the last window left in the tab
  enable_git_status = true,
  window = {
    position = 'right'
  }
}
