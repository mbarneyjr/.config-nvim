-- leader settings
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- global keymaps
vim.keymap.set('n', '<leader>dj', vim.diagnostic.goto_next, { desc = '[d]iagnostic next' })
vim.keymap.set('n', '<leader>dk', vim.diagnostic.goto_prev, { desc = '[d]iagnostic previous' })
vim.keymap.set('n', '<c-_>', '<cmd>noh<cr>', { desc = 'clear search highlight' })
