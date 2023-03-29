require('toggleterm').setup({
  size = function(term)
    if term.direction == "horizontal" then
      return 15
    elseif term.direction == "vertical" then
      return vim.o.columns * 0.4
    end
  end,
})

vim.keymap.set('t', '<esc>', '<c-\\><c-n>')
vim.keymap.set('n', '<c-t>', '<cmd>ToggleTerm direction=horizontal<cr>')
vim.keymap.set('n', '<c-v>', '<cmd>ToggleTerm direction=vertical<cr>')
