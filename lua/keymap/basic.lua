--------------------------------------------------
-- noremap=true: indicates that no remapping
-- slient=true: indicates that no redundant
-- information will be output
--------------------------------------------------

local opt = { noremap = true, silent = true }
local map = vim.api.nvim_set_keymap

map("n", "<leader>rl", ":LspStart<CR>", opt)
map("n", "<leader>gd", ":Gvdiffsplit<CR>", opt)
map("n", "<leader>gb", ":Git blame<CR>", opt)
map("n", "<leader>G", ":G<CR>", opt)

-- vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.formatting_sync()]]

--------------------------------------------------
-- system copy and paste
--------------------------------------------------

map("n", "<leader>p", '"+p', opt)
map("v", "<leader>y", '"+y', opt)



--------------------------------------------------
-- go up and down
--------------------------------------------------

map("n", "<C-j>", "4j", opt)
map("n", "<C-k>", "4k", opt)
map("n", "<C-u>", "9k", opt)
map("n", "<C-d>", "9j", opt)

map("v", "<C-j>", "4j", opt)
map("v", "<C-k>", "4k", opt)
map("v", "<C-u>", "9k", opt)
map("v", "<C-d>", "9j", opt)



--------------------------------------------------
-- close all windows, save and quit nvim
--------------------------------------------------

map("n", "<leader>Q", ":<C-U>qa!<CR>", opt)

map("n", "<leader>w", ":w<CR>", opt)
map("n", "<leader>q", ":q<CR>", opt)



--------------------------------------------------
-- windows
--------------------------------------------------

-- cancel default function of "s" key
-- map("n", "s", "", opt)

-- split window horizontally and vertically
map("n", "<A-s>", ":vsp<CR>", opt)
map("n", "<A-S>", ":sp<CR>", opt)

-- close current window
map("n", "<A-c>", "<C-w>c", opt)

-- close other windows
-- map("n", "so", "<C-w>o", opt)

-- jump between windows: alt + hjkl
map("n", "<A-h>", "<C-w>h", opt)
map("n", "<A-j>", "<C-w>j", opt)
map("n", "<A-k>", "<C-w>k", opt)
map("n", "<A-l>", "<C-w>l", opt)

-- adjust the width and height of the window
map("n", "<C-=>", ":vertical resize +2<CR>", opt)
map("n", "<C-->", ":vertical resize -2<CR>", opt)
map("n", "+", ":resize +2<CR>", opt)
map("n", "_", ":resize -2<CR>", opt)
-- map("n", "s=", "<C-w>=", opt)



--------------------------------------------------
-- terminal
--------------------------------------------------

map("n", "<leader>t", ":sp | terminal<CR>", opt)
map("n", "<leader>at", ":terminal<CR>", opt)
map("n", "<leader>rt", ":vsp | terminal<CR>", opt)

map("t", "<Esc>", "<C-\\><C-n>", opt)

map("t", "<A-h>", [[ <C-\><C-N><C-w>h ]], opt)
map("t", "<A-j>", [[ <C-\><C-N><C-w>j ]], opt)
map("t", "<A-k>", [[ <C-\><C-N><C-w>k ]], opt)
map("t", "<A-l>", [[ <C-\><C-N><C-w>l ]], opt)
