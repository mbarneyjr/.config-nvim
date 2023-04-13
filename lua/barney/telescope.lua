local telescope = require('telescope')
local action_layout = require('telescope.actions.layout')
local builtin = require('telescope.builtin')

telescope.setup({
  defaults = {
    file_ignore_patterns = {
      'node_modules',
      '.git',
      'build',
      'cdk.out',
      'dist',
      'artifacts',
      '.venv',
    },
    hidden = true,
    no_ignore = true,
    mappings = {
      i = {
        ['?'] = action_layout.toggle_preview,
      },
    },
  },
  pickers = {
    find_files = {
      hidden = true,
      layout = 'flex',
      no_ignore = true,
    },
  },
})

vim.keymap.set('n', '<leader>ff', function() builtin.find_files({ hidden = true }) end, { desc = '[f]ind [f]iles' })
vim.keymap.set('n', '<leader>fs', builtin.live_grep, { desc = '[f]ind grep [S]earch' })
vim.keymap.set('n', '<leader>fg', builtin.git_files, { desc = '[f]ind [g]it files' })
vim.keymap.set('n', '<leader>fd', builtin.diagnostics, { desc = '[f]ind [d]iagnostics' })
