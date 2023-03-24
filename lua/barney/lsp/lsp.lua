local on_attach = function(_, bufnr)
  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { buffer = bufnr, desc = '[LSP] [R]e[n]ame' })
  vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { buffer = bufnr, desc = '[LSP] [C]ode [A]ction' })

  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { buffer = bufnr, desc = '[LSP] [G]oto [D]efinition' })
  vim.keymap.set('n', 'gr', require('telescope.builtin').lsp_references, { buffer = bufnr, desc = '[LSP] [G]oto [R]eferences' })
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, { buffer = bufnr, desc = '[LSP] [G]oto [I]mplementation' })
  vim.keymap.set('n', '<leader>gD', vim.lsp.buf.type_definition, { buffer = bufnr, desc = '[LSP] Type [D]efinition' })
  vim.keymap.set('n', '<leader>ds', require('telescope.builtin').lsp_document_symbols, { buffer = bufnr, desc = '[LSP] [D]ocument [S]ymbols' })
  vim.keymap.set('n', '<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, { buffer = bufnr, desc = '[LSP] [W]orkspace [S]ymbols' })

  -- See `:help K` for why this keymap
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, { buffer = bufnr, desc = '[LSP] Hover Documentation' })
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, { buffer = bufnr, desc = '[LSP] Signature Documentation' })
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { buffer = bufnr, desc = '[LSP] [G]oto [D]eclaration' })

  -- Create a command `:Format` local to the LSP buffer
  vim.keymap.set('n', '<C-f>', vim.lsp.buf.format, { buffer = bufnr, desc = '[LSP] [f]ormat document' })
end

vim.api.nvim_create_autocmd('LspAttach', {
  callback = on_attach
})

local lspconfig = require('lspconfig')
local null_ls = require('null-ls')
local mason_lspconfig = require('mason-lspconfig')
local capabilities = vim.lsp.protocol.make_client_capabilities()
local server_settings = require('barney.lsp.servers')
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

require('mason').setup()
null_ls.setup({
  debug = false,
})
mason_lspconfig.setup({})
require('mason-null-ls').setup_handlers({
  function (source_name, methods)
    require('mason-null-ls.automatic_setup')(source_name, methods)
  end,
  stylua = function()
    null_ls.register(null_ls.builtins.formatting.stylua)
  end,
})
mason_lspconfig.setup_handlers({
  function(server_name)
    lspconfig[server_name].setup({
      capabilities = capabilities,
      settings = server_settings[server_name],
    })
  end,
})
