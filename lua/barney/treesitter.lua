require'nvim-treesitter.configs'.setup({
  -- A list of parser names, or 'all' (the five listed parsers should always be installed)
  ensure_installed = {
    'help',
    'javascript',
    'typescript',
    'python',
    'lua',
    'vim',
    'query',
    'yaml',
    'json',
    'hcl',
    'terraform',
    'dockerfile',
    'dot',
    'make',
    'html',
    'css',
    'bash',
  },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,

  indent = { enable = true, disable = { 'python' } },

  incremental_selection = {
    enable = true,
    keymaps = {
      -- init_selection = '<c-{>',
      -- node_incremental = '<c-{>',
      -- scope_incremental = '<c-}>',
      -- node_decremental = '<c-}>',
    },
  },

  autotag = {
    enable = true,
  },

  highlight = {
    enable = true,

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false
  },
})

vim.keymap.set('n', '<leader>it', function()
  vim.treesitter.inspect_tree()
end, { desc = 'Open treesitter playground for current buffer' })
