require('nvim_comment').setup({
  hook = function()
    if vim.api.nvim_buf_get_option(0, 'filetype') == 'dot' then
      vim.api.nvim_buf_set_option(0, 'commentstring', '// %s')
    end
    if vim.api.nvim_buf_get_option(0, 'filetype') == 'terraform' then
      vim.api.nvim_buf_set_option(0, 'commentstring', '# %s')
    end
  end,
})

