vim.g.mapleader = " "

local keymap = vim.keymap

keymap.set("n", "<leader>h", vim.cmd.nohl)
keymap.set("n", "<leader>ff", ":Telescope find_files no_ignore=true<cr>")
keymap.set("n", "<leader>fg", ":Telescope live_grep<cr>")
keymap.set("n", "<leader>fb", ":Telescope buffers<cr>")
keymap.set("n", "<leader>fh", ":Telescope help_tags<cr>")
keymap.set("n", "<leader>e", vim.cmd.Ex)
keymap.set("n", "L", vim.cmd.bn)
keymap.set("n", "H", vim.cmd.bN)
keymap.set("n", "<leader>c", vim.cmd.bd)
keymap.set("n", "<C-u>", "<C-U>zz")
keymap.set("n", "<C-d>", "<C-d>zz")
