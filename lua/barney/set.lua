vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.undodir = os.getenv('HOME') .. '/.vim/undodir'
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.scrolloff = 8
vim.opt.updatetime = 50
vim.opt.colorcolumn = '120'

vim.opt.completeopt = 'menuone,noselect'
vim.opt.guicursor = 'a:blinkon100'

vim.opt.clipboard = 'unnamedplus'
vim.opt.splitright = true

vim.g.do_filetype_lua = true
vim.g.did_load_filetypes = false
