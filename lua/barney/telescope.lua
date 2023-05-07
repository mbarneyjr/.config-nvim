local telescope = require('telescope')
local action_layout = require('telescope.actions.layout')
local builtin = require('telescope.builtin')
local actions = require('telescope.actions')

telescope.setup({
  defaults = {
    path_display = { 'truncate' },
    sorting_strategy = 'ascending',
    layout_config = {
      horizontal = {
        prompt_position = 'top',
        preview_width = 0.55,
      },
      vertical = {
        mirror = false,
      },
      width = 0.87,
      height = 0.80,
      preview_cutoff = 120,
    },

    mappings = {
      i = {
        ['<C-n>'] = actions.cycle_history_next,
        ['<C-p>'] = actions.cycle_history_prev,
        ['<C-j>'] = actions.move_selection_next,
        ['<C-k>'] = actions.move_selection_previous,
        ['?'] = action_layout.toggle_preview,
      },
      n = { ['q'] = actions.close },
    },
    file_ignore_patterns = {
      -- 'node_modules',
      -- '.git',
      -- 'build',
      -- 'cdk.out',
      -- 'dist',
      -- 'artifacts',
      -- '.venv',
    },
    hidden = true,
    no_ignore = true,
  },
  -- pickers = {
  --   find_files = {
  --     hidden = true,
  --     layout = 'flex',
  --     no_ignore = true,
  --   },
  -- },
  extensions = {
    fzf = {
      fuzzy = true,
      override_generic_sorter = true,
      override_file_sorter = true,
      case_mode = 'smart_case',
    },
  },
})
telescope.load_extension('fzf')

vim.keymap.set('n', '<leader>ff', function() builtin.find_files({ hidden = true }) end, { desc = '[f]ind [f]iles' })
vim.keymap.set('n', '<leader>fF', function() builtin.find_files({ hidden = true, no_ignore = true }) end, { desc = '[f]ind all [F]iles' })
vim.keymap.set('n', '<leader>fs', builtin.live_grep, { desc = '[f]ind grep [S]earch' })
vim.keymap.set('n', '<leader>fg', builtin.git_files, { desc = '[f]ind [g]it files' })
vim.keymap.set('n', '<leader>fd', builtin.diagnostics, { desc = '[f]ind [d]iagnostics' })
