require('neo-tree').setup({
  auto_clean_after_session_restore = true,
  close_if_last_window = true,
  open_files_do_not_replace_types = { 'terminal', 'trouble', 'qf', 'fugitive' },
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
    use_libuv_file_watcher = true,
    follow_current_file = true,
  },
})
vim.keymap.set('n', '<leader>T', '<cmd>Neotree left toggle<cr>', { desc = 'open neotree sidebar' })
vim.keymap.set('n', '<leader>t', '<cmd>Neotree float toggle<cr>', { desc = 'open neotree float' })

vim.g.neo_tree_remove_legacy_commands = true
