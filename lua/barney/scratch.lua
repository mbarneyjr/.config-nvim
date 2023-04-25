-- create a function that will open a neovim scratch buffer in a vertical split
local function scratch_buffer()
  vim.cmd('vnew')
  vim.cmd('setlocal buftype=nofile')
  vim.cmd('setlocal bufhidden=hide')
  vim.cmd('setlocal noswapfile')
  vim.cmd('setlocal nobuflisted')
end

vim.keymap.set('n', '<c-N>', scratch_buffer, { desc = 'scratch buffer' })
