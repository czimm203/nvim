vim.g.mapleader = " "

local keymap = vim.keymap

keymap.set("n", "<leader>h", ":nohl<CR>")
keymap.set("n", "<leader>ff", ":Telescope find_files<cr>")
keymap.set("n", "<leader>fg", ":Telescope live_grep<cr>")
keymap.set("n", "<leader>fb", ":Telescope buffers<cr>")
keymap.set("n", "<leader>fh", ":Telescope help_tags<cr>")
keymap.set("n", "<leader>e", ":NvimTreeToggle<cr>")
