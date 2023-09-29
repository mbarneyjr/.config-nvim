vim.api.nvim_create_autocmd({ 'BufRead', 'BufNewFile' }, {
  pattern = {
    '*.tf',
    '*.tfbackend',
    '*.tfvars',
  },
  callback = function(buf)
    vim.bo.filetype = 'terraform'
    local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
    vim.api.nvim_create_autocmd("BufWritePre", {
      group = augroup,
      buffer = buf.buf,
      callback = function()
        vim.lsp.buf.format()
      end,
    })
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
