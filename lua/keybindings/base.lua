-- leader key --
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local map = vim.api.nvim_set_keymap
-- noremap mean no remapping, slient indicates that no redundant information will be output.
local opt = { noremap = true, silent = true }

-- scroll up and down
map("n", "<C-j>", "4j", opt)
map("n", "<C-k>", "4k", opt)
map("n", "<C-u>", "9k", opt)
map("n", "<C-d>", "9j", opt)

---------------- Telescope Config ----------------
-- find some files
map("n", "<C-p>", ":Telescope find_files<CR>", opt)
-- global search
map("n", "<C-f>", ":Telescope live_grep<CR>", opt)

-- nvim-tree --
-- alt + m : open and close tree
map("n", "<A-m>", ":NvimTreeToggle<CR>", opt)
