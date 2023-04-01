require('nvim-tree').setup({
  sort_by = 'case_sensitive',
  renderer = {
    group_empty = true,
    icons = {
      show = {
        folder = false,
        folder_arrow = false,
        file = false,
        modified = false,
        git = false,
      },
    },
  },
  filters = {
    dotfiles = true,
  },
  git = {
    ignore = false
  },
  update_focused_file = {
    enable = true,
    update_cwd = true,
  },
})

vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = require('nvim-tree.api').tree.open })

-- create keymap for control+~ to toggle nvim-tree
vim.api.nvim_set_keymap('n', '<C-`>', ':NvimTreeToggle<CR>', {})
-- create count keymap to open nvim-tree at a certain size
vim.keymap.set('n', '<c-~>', function() return '<cmd>NvimTreeResize ' .. vim.v.count .. '<cr>' end, { expr = true })
