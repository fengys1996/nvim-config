-- windows split shortcut key --

local map = vim.api.nvim_set_keymap
-- noremap mean no remapping, slient indicates that no redundant information will be output.
local opt = { noremap = true, silent = true }

-- cancel s default function
map("n", "s", "", opt)
-- split horizontally
map("n", "sh", ":vsp<CR>", opt)
-- split vertically
map("n", "sv", ":sp<CR>", opt)

-- shutdown current window
map("n", "sc", "<C-w>c", opt)
-- shutdown other windows
map("n", "so", "<C-w>o", opt)

-- Alt + hjkl : Jump between windows
map("n", "<A-h>", "<C-w>h", opt)
map("n", "<A-j>", "<C-w>j", opt)
map("n", "<A-k>", "<C-w>k", opt)
map("n", "<A-l>", "<C-w>l", opt)

-- width adjustment of window
map("n", "s,", ":vertical resize -2<CR>", opt)
map("n", "s.", ":vertical resize +2<CR>", opt)

-- height adjustment of window
map("n", "sj", ":resize +2<CR>", opt)
map("n", "sk", ":resize -2<CR>", opt)

-- equal scaling adjustment of window
map("n", "s=", "<C-w>=", opt)

------------------ bufferline --------------------
-- tab switching(left and right)
map("n", "<C-h>", ":BufferLineCyclePrev<CR>", opt)
map("n", "<C-l>", ":BufferLineCycleNext<CR>", opt)
-- close
map("n", "<C-w>", ":Bdelete!<CR>", opt)
map("n", "<leader>bl", ":BufferLineCloseRight<CR>", opt)
map("n", "<leader>bh", ":BufferLineCloseLeft<CR>", opt)
map("n", "<leader>ba", ":BufferLineCloseLeft<CR>:BufferLineCloseRight<CR>", opt)
-- map("n", "<leader>bc", ":BufferLinePickClose<CR>", opt)