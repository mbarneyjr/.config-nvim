require('toggleterm').setup({
  size = function(term)
    if term.direction == "horizontal" then
      return 15
    elseif term.direction == "vertical" then
      return vim.o.columns * 0.4
    end
  end,
})

vim.keymap.set('t', '<c-t>', '<c-\\><c-n>', { desc = 'exit terminal mode' })
vim.keymap.set('t', '<c-s>', '<c-\\><c-n>', { desc = 'exit terminal mode' })
vim.keymap.set('n', '<c-t>', function() return '<cmd>ToggleTerm direction=horizontal size=' .. vim.v.count .. '<cr>' end, { expr = true, desc = 'toggle terminal horizontal' })
vim.keymap.set('n', '<c-s>', function() return '<cmd>ToggleTerm direction=vertical size=' .. vim.v.count .. '<cr>' end, { expr = true, desc = 'toggle terminal vertical' })
