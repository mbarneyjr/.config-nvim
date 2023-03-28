require('copilot').setup({
  panel = {
    enabled = true,
    auto_refresh = false,
    keymap = {
      jump_prev = '[[',
      jump_next = ']]',
      accept = '<CR>',
      refresh = 'gr',
      open = '<M-CR>'
    },
    layout = {
      position = 'bottom', -- | top | left | right
      ratio = 0.4
    },
  },
  suggestion = {
    enabled = true,
    auto_trigger = true,
    debounce = 75,
    keymap = {
      accept = '<C-y>',
      accept_word = false,
      accept_line = false,
      next = '<C-n>',
      prev = '<C-p>',
      dismiss = '<C-x>',
    },
  },
  filetypes = {
    ['*'] = true,
  },
  copilot_node_command = 'node', -- Node.js version must be > 16.x
  server_opts_overrides = {},
})
