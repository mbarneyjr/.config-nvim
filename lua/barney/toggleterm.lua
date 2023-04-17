require('toggleterm').setup({
  size = function(term)
    if term.direction == "horizontal" then
      return 15
    elseif term.direction == "vertical" then
      return vim.o.columns * 0.4
    end
  end,
})

vim.keymap.set('t', '<c-t>', '<c-\\><c-n>')
vim.keymap.set('t', '<c-s>', '<c-\\><c-n>')
vim.keymap.set('n', '<c-t>', function() return '<cmd>ToggleTerm direction=horizontal size=' .. vim.v.count .. '<cr>' end, { expr = true })
vim.keymap.set('n', '<c-s>', function() return '<cmd>ToggleTerm direction=vertical size=' .. vim.v.count .. '<cr>' end, { expr = true })
