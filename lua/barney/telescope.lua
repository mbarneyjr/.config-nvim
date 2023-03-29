local telescope = require('telescope')
local action_layout = require('telescope.actions.layout')
local builtin = require('telescope.builtin')

telescope.setup({
  defaults = {
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
    },
  },
})

vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = '[f]ind [f]iles' })
vim.keymap.set('n', '<leader>fs', builtin.live_grep, { desc = '[f]ind grep [S]earch' })
vim.keymap.set('n', '<leader>fg', builtin.git_files, { desc = '[f]ind [g]it files' })
vim.keymap.set('n', '<leader>fd', builtin.diagnostics, { desc = '[f]ind [d]iagnostics' })
