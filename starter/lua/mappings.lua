require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

map('t', '<ESC>', [[<C-\><C-n>]], { noremap = true, silent = true })
map('n', '<leader><Tab>', '<C-w>w')
map('n', '<leader><S-Tab>', '<C-w>W')
map('i', '<C-ESC>', '<ESC>i<Right>', { noremap = true, silent = true })
