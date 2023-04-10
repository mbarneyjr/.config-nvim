require('neo-tree').setup({
  default_component_configs = {
    icon = {
      folder_closed = '>',
      folder_open = 'v',
      folder_empty = ' ',
      default = ' ',
    },
    git_status = {
      symbols = {
        added = 'A',
        modified = 'M',
        deleted = 'D',
        renamed = 'R',
        untracked = ' ',
        ignored = 'I',
        unstaged = 'U',
        staged = 'S',
        conflict = 'C',
      },
    },
  },
  filesystem = {
    filtered_items = {
      hide_dotfiles = false,
      hide_gitignored = false,
      hide_hidden = false,
    },
    follow_current_file = true,
  },
})
vim.keymap.set('n', '<leader>T', '<cmd>NeoTreeShowToggle<cr>')
vim.keymap.set('n', '<leader>t', '<cmd>NeoTreeFloatToggle<cr>')
