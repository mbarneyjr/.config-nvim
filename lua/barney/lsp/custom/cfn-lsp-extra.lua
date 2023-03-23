vim.filetype.add {
  pattern = {
    ['.*'] = {
      priority = math.huge,
      function(_, bufnr)
        local line1 = vim.filetype.getlines(bufnr, 1)
        local line2 = vim.filetype.getlines(bufnr, 2)
        if vim.filetype.matchregex(line1, [[^AWSTemplateFormatVersion]] ) then
          return 'yaml.cloudformation'
        elseif vim.filetype.matchregex(line1, [[["']AWSTemplateFormatVersion]] ) or
               vim.filetype.matchregex(line2, [[["']AWSTemplateFormatVersion]] ) then
          return 'json.cloudformation'
        end
      end,
    },
  },
}

local lspconfig = require('lspconfig')
local configs = require('lspconfig.configs')

if not configs['cfn-lsp-extra'] then
  configs['cfn-lsp-extra'] = {
    default_config = {
      cmd = { 'cfn-lsp-extra' },
      filetypes = { 'yaml.cloudformation', 'json.cloudformation' },
      root_dir = function(fname) return lspconfig.util.find_git_ancestor(fname) end,
      settings = {
        validate = false,
      },
    }
  }
end

lspconfig['cfn-lsp-extra'].setup({})
