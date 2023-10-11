local key = require("barney.lib.keymap")

vim.g.mapleader = " "
vim.g.maplocalleader = " "

key.nmap("<leader>sv", "<C-w>v", "Split window vertically")
key.nmap("<leader>sh", "<C-w>s", "Split window horizontally")
key.nmap("<leader>se", "<C-w>=", "Make splits equal size")
key.nmap("<leader>sx", "<cmd>close<CR>", "Close current split")

vim.keymap.set("n", "<c-_>", "<cmd>noh<cr>", { desc = "clear search highlight" })
