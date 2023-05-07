local dap = require('dap')
local mason_nvim_dap = require('mason-nvim-dap')

mason_nvim_dap.setup({
  automatic_setup = true,
})
mason_nvim_dap.setup({})

-- create a keymap to add a breakpoint
vim.keymap.set('n', '<leader>db', dap.toggle_breakpoint, { desc = 'toggle [d]e[b]ugger breakpoint' })
vim.keymap.set('n', '<leader>dc', function() require('dap').continue() end, { desc = 'debugger [c]ontinue' })
vim.keymap.set('n', '<leader>do', function() require('dap').step_over() end, { desc = 'debugger step [o]ver' })
vim.keymap.set('n', '<leader>di', function() require('dap').step_into() end, { desc = 'debugger step [i]nto' })
vim.keymap.set('n', '<leader>dO', function() require('dap').step_out() end, { desc = 'debugger step [O]ut' })
vim.keymap.set('n', '<Leader>dl', function()
  require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: '))
end, { desc = 'debugger [l]og point' })
vim.keymap.set('n', '<Leader>dr', function() require('dap').repl.open() end, { desc = 'debugger [r]epl' })
-- vim.keymap.set('n', '<Leader>dl', function() require('dap').run_last() end)
vim.keymap.set({'n', 'v'}, '<leader>dh', function()
  require('dap.ui.widgets').hover()
end, { desc = 'debugger [h]over' })
vim.keymap.set({'n', 'v'}, '<Leader>dp', function()
  require('dap.ui.widgets').preview()
end, { desc = 'debugger [p]review' })
vim.keymap.set('n', '<Leader>df', function()
  local widgets = require('dap.ui.widgets')
  widgets.centered_float(widgets.frames)
end, { desc = 'debugger [f]rames' })
vim.keymap.set('n', '<Leader>ds', function()
  local widgets = require('dap.ui.widgets')
  widgets.centered_float(widgets.scopes)
end, { desc = 'debugger [s]copes' })
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
