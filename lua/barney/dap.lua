local dap = require('dap')
local mason_nvim_dap = require('mason-nvim-dap')

mason_nvim_dap.setup({
  automatic_setup = true,
})
mason_nvim_dap.setup_handlers({})

-- create a keymap to add a breakpoint
vim.keymap.set('n', '<leader>db', dap.toggle_breakpoint, { desc = 'toggle [d]e[b]ugger breakpoint' })
vim.keymap.set('n', '<leader>dc', function() require('dap').continue() end)
vim.keymap.set('n', '<leader>do', function() require('dap').step_over() end)
vim.keymap.set('n', '<leader>di', function() require('dap').step_into() end)
vim.keymap.set('n', '<leader>dO', function() require('dap').step_out() end)
vim.keymap.set('n', '<Leader>dl', function() require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end)
vim.keymap.set('n', '<Leader>dr', function() require('dap').repl.open() end)
-- vim.keymap.set('n', '<Leader>dl', function() require('dap').run_last() end)
vim.keymap.set({'n', 'v'}, '<leader>dh', function()
  require('dap.ui.widgets').hover()
end)
vim.keymap.set({'n', 'v'}, '<Leader>dp', function()
  require('dap.ui.widgets').preview()
end)
vim.keymap.set('n', '<Leader>df', function()
  local widgets = require('dap.ui.widgets')
  widgets.centered_float(widgets.frames)
end)
vim.keymap.set('n', '<Leader>ds', function()
  local widgets = require('dap.ui.widgets')
  widgets.centered_float(widgets.scopes)
end)
vim.keymap.set('n', '<leader>du', require('dapui').toggle, { desc = 'toggle [d]ebgger [u]ser interface' })

-- setup nvim-dap-ui
require('dapui').setup({
  -- simple icons
  controls = {
    icons = {
      disconnect = '⏏',
      pause = '⏸',
      play = '⏵',
      run_last = '⏭',
      step_back = '⏴',
      step_into = '▼',
      step_out = '▲',
      step_over = '▶',
      terminate = '×',
    },
  },
  icons = {
    expanded = '▾',
    collapsed = '▸',
    current_frame = '●',
  },
  layouts = {
    {
      elements = {
        { id = 'scopes', size = 0.5 },
        { id = 'watches', size = 0.5 },
      },
      position = 'left',
      size = 40,
    },
  },
})
