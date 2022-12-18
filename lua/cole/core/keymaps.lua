vim.g.mapleader = " "

local keymap = vim.keymap

keymap.set("n", "<leader>h", vim.cmd.nohl)
-- keymap.set("n", "<leader>ff", ":Telescope find_files no_ignore=true<cr>")
-- keymap.set("n", "<leader>fg", ":Telescope live_grep<cr>")
-- keymap.set("n", "<leader>fb", ":Telescope buffers<cr>")
-- keymap.set("n", "<leader>fh", ":Telescope help_tags<cr>")
keymap.set("n", "<leader>e", vim.cmd.Ex)
keymap.set("n", "L", vim.cmd.bn)
keymap.set("n", "H", vim.cmd.bN)
keymap.set("n", "<leader>c", vim.cmd.bd)
keymap.set("n", "<C-u>", "<C-U>zz")
keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
vim.keymap.set('n', '<leader>/', function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[/] Fuzzily search in current buffer]' })

vim.keymap.set('n', '<leader>ff', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>fh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>fw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>fg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>fd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })
