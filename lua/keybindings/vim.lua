local map = vim.api.nvim_set_keymap
-- noremap mean no remapping, slient indicates that no redundant information will be output.
local opt = { noremap = true, silent = true }

----------------- vim-signify --------------------
map("n", "<leader>gd", ":Gdiffsplit<CR>", opt)
map("n", "<leader>gb", ":Git blame<CR>", opt)