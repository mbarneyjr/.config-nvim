local install_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
local is_bootstrap = false
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  is_bootstrap = true
  vim.fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
  vim.cmd('packadd packer.nvim')
end

require('packer').startup(function(use)
  use('wbthomason/packer.nvim')

  -- color theme
  use('tomasiser/vim-code-dark')
  use('haishanh/night-owl.vim')

  -- language support
  use({
    'nvim-treesitter/nvim-treesitter',
    run = function()
      local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
      ts_update()
    end,
  })
  use({
    'nvim-treesitter/nvim-treesitter-textobjects',
    after = 'nvim-treesitter',
  })
  use({
    'neovim/nvim-lspconfig',
    requires = {
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
      'jose-elias-alvarez/null-ls.nvim',
      'jay-babu/mason-null-ls.nvim',
      'j-hui/fidget.nvim',
      'folke/neodev.nvim',
    },
  })
  use({
    'hrsh7th/nvim-cmp',
    requires = {
      'hrsh7th/cmp-nvim-lsp',
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',
      'onsails/lspkind.nvim',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-nvim-lua',
    },
  })
  use('tamago324/nlsp-settings.nvim')

  -- git integration
  use('lewis6991/gitsigns.nvim')
  use('tpope/vim-fugitive')
  use('tpope/vim-rhubarb')

  -- misc plugins
  use({ 'zbirenbaum/copilot.lua' })
  use({
    'nvim-telescope/telescope.nvim',
    tag = '0.1.1',
    requires = {
      'nvim-lua/plenary.nvim'
    },
  })
  use('nvim-tree/nvim-tree.lua')
  use('ThePrimeagen/harpoon')
  use('mbbill/undotree')
  use('ThePrimeagen/vim-be-good')
  use 'nvim-lualine/lualine.nvim'
  use({
    'folke/trouble.nvim',
    config = function()
      require('trouble').setup({
        icons = false,
        fold_open = 'v',
        fold_closed = '>',
        indent_lines = true,
        signs = {
          error = '[ERROR]',
          warning = '[WARN]',
          hint = '[HINT]',
          information = '[INFO]',
        },
        use_diagnostic_signs = false,
      })
    end,
  })
  use('akinsho/toggleterm.nvim')

  if is_bootstrap then
    require('packer').sync()
  end
end)

-- reboot nvim if plugins are being installed
if is_bootstrap then
  print('==================================')
  print('    Plugins are being installed')
  print('    Wait until Packer completes,')
  print('       then restart nvim')
  print('==================================')
  return
end

local packer_group = vim.api.nvim_create_augroup('Packer', { clear = true })
vim.api.nvim_create_autocmd('BufWritePost', {
  command = 'source <afile> | silent! LspStop | silent! LspStart | PackerCompile',
  group = packer_group,
  pattern = vim.fn.expand('$MYVIMRC'),
})
