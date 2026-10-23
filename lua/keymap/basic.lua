--------------------------------------------------
-- noremap=true: indicates that no remapping
-- slient=true: indicates that no redundant
-- information will be output
--------------------------------------------------

local opt = { noremap = true, silent = true }
local map = vim.api.nvim_set_keymap

-- forbid recording a macro via q
map("n", "q", "", opt)
map("v", "q", "", opt)

-- go up and down
map("n", "<C-j>", "4j", opt)
map("n", "<C-k>", "4k", opt)
map("n", "<C-u>", "9k", opt)
map("n", "<C-d>", "9j", opt)
map("v", "<C-j>", "4j", opt)
map("v", "<C-k>", "4k", opt)
map("v", "<C-u>", "9k", opt)
map("v", "<C-d>", "9j", opt)

-- close all windows
map("n", "<leader>Q", ":<C-U>qa!<CR>", opt)

-- save or quit current file
map("n", "<leader>w", ":w<CR>", opt)
map("n", "<leader>q", ":q<CR>", opt)

-- close current buffer
map("n", "<leader>cc", ":bd!<CR>", opt)

-- split window horizontally and vertically
map("n", "<A-s>", ":vsp<CR>", opt)
map("n", "<A-S>", ":sp<CR>", opt)

-- close current window
map("n", "<A-c>", "<C-w>c", opt)

if vim.g.screen_vertical then
    map("n", "<leader>gd", ":Ghdiffsplit<CR>", opt)
else
    map("n", "<leader>gd", ":Gvdiffsplit<CR>", opt)
end
map("n", "<leader>gb", ":Git blame<CR>", opt)
map("n", "<leader>G", ":tab G<CR>", opt)
map("n", "<leader>g", ":G<CR>", opt)

-- jump between windows: alt + hjkl
map("n", "<A-h>", "<C-w>h", opt)
map("n", "<A-j>", "<C-w>j", opt)
map("n", "<A-k>", "<C-w>k", opt)
map("n", "<A-l>", "<C-w>l", opt)

map("n", "<A-H>", "<C-w>H", opt)
map("n", "<A-J>", "<C-w>J", opt)
map("n", "<A-K>", "<C-w>K", opt)
map("n", "<A-L>", "<C-w>L", opt)

-- adjust the width and height of the window
map("n", "<C-=>", ":vertical resize +2<CR>", opt)
map("n", "<C-->", ":vertical resize -2<CR>", opt)
map("n", "+", ":resize +2<CR>", opt)
map("n", "_", ":resize -2<CR>", opt)

map("t", "<Esc>", "<C-\\><C-n>", opt)

map("t", "<A-h>", [[ <C-\><C-N><C-w>h ]], opt)
map("t", "<A-j>", [[ <C-\><C-N><C-w>j ]], opt)
map("t", "<A-k>", [[ <C-\><C-N><C-w>k ]], opt)
map("t", "<A-l>", [[ <C-\><C-N><C-w>l ]], opt)

map("v", "<leader>y", '"+y', opt)
map("n", "<leader>p", '"+p', opt)
