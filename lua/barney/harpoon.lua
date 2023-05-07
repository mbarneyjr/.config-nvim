local mark = require('harpoon.mark')
local ui = require('harpoon.ui')

vim.keymap.set('n', '<leader>a', mark.add_file, { desc = "add file to harpoon" })
vim.keymap.set('n', '<leader>e', ui.toggle_quick_menu, { desc = "toggle harpoon edit menu" })
vim.keymap.set('n', '<leader>1', function() ui.nav_file(1) end, { desc = "goto harppon 1" })
vim.keymap.set('n', '<leader>2', function() ui.nav_file(2) end, { desc = "goto harppon 2" })
vim.keymap.set('n', '<leader>3', function() ui.nav_file(3) end, { desc = "goto harppon 3" })
vim.keymap.set('n', '<leader>4', function() ui.nav_file(4) end, { desc = "goto harppon 4" })
