-- hier werden allgemeine Keybinds gesetzt

vim.g.mapleader = " "

vim.api.nvim_set_keymap("n", "<leader>e", ":NvimTreeFocus<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>c", ":NvimTreeClos<CR>", { noremap = true })

vim.api.nvim_set_keymap("i", "jk", "<ESC>", { noremap = true })
vim.api.nvim_set_keymap("v", "jk", "<ESC>", { noremap = true })
-- Use Ctrl+H to switch to the previous buffer
vim.api.nvim_set_keymap("n", "<S-h>", ":bprev<CR>", { noremap = true, silent = true })

-- Use Ctrl+L to switch to the next buffer
vim.api.nvim_set_keymap("n", "<S-l>", ":bnext<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>t", ":ToggleTerm<CR>", { noremap = true })
vim.api.nvim_set_keymap("t", "jk", "<C-\\><C-n><CR>", { noremap = true, silent = true })
