vim.api.nvim_create_autocmd({ 'BufRead', 'BufNewFile' }, {
  pattern = {
    '*.tf',
    '*.tfvars',
  },
  callback = function()
    vim.bo.filetype = 'terraform'
  end
})
vim.api.nvim_create_autocmd({ 'BufRead', 'BufNewFile' }, {
  pattern = {
    '*.hcl',
    '.terraformrc',
    '.terraform.rc',
  },
  callback = function()
    vim.bo.filetype = 'hcl'
  end
})
vim.api.nvim_create_autocmd({ 'BufRead', 'BufNewFile' }, {
  pattern = {
    '*.tfstate',
    '*.tfstate.backup',
  },
  callback = function()
    vim.bo.filetype = 'json'
  end
})
