--------------------------------------------------
-- set leader key
--------------------------------------------------

vim.g.mapleader = " "
vim.g.maplocalleader = " "



--------------------------------------------------
-- noremap=true: indicates that no remapping
-- slient=true: indicates that no redundant
-- information will be output
--------------------------------------------------
local opt = { noremap = true, silent = true }
local map = vim.api.nvim_set_keymap

-- system copy and paste
map("n", "<leader>p", '"+p', opt)
map("v", "<leader>y", '"+y', opt)

-- go up and down
map("n", "<C-j>", "4j", opt)
map("n", "<C-k>", "4k", opt)
map("n", "<C-u>", "9k", opt)
map("n", "<C-d>", "9j", opt)

map("v", "<C-j>", "4j", opt)
map("v", "<C-k>", "4k", opt)
map("v", "<C-u>", "9k", opt)
map("v", "<C-d>", "9j", opt)

-- close all windows, save and quit nvim
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



--------------------------------------------------
-- nvim tree
--------------------------------------------------

-- open and close file tree
map("n", "<A-m>", ":NvimTreeToggle<CR>", opt)

-- open the leafs of the tree leading to the file in
-- the buffer, and it will change the cursor in the
-- tree for the current bufname
-- map("n", "<A-m>", ":NvimTreeFindFileToggle<CR>", opt)

map("n", "<leader>ll", ":NvimTreeFindFile<CR>", opt)



------------------------------------------------------------
-- bufferline
------------------------------------------------------------

-- tab swith
-- map("n", "<C-h>", ":BufferLineCyclePrev<CR>", opt)
-- map("n", "<C-l>", ":BufferLineCycleNext<CR>", opt)

-- bufferline close
-- map("n", "<C-w>", ":Bdelete!<CR>", opt)
-- map("n", "<leader>bl", ":BufferLineCloseRight<CR>", opt)
-- map("n", "<leader>bh", ":BufferLineCloseLeft<CR>", opt)
-- map("n", "<leader>ba", ":BufferLineCloseLeft<CR>:BufferLineCloseRight<CR>", opt)
-- map("n", "<leader>bc", ":BufferLinePickClose<CR>", opt)



------------------------------------------------------------
-- hop
------------------------------------------------------------
map('', 'f',
	"<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true })<cr>"
	, opt)
map('', 'F',
	"<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })<cr>"
	, opt)
map('', 's', "<cmd>HopChar2AC<cr>", opt)
map('', 'S', "<cmd>HopChar2BC<cr>", opt)



--------------------------------------------------
-- telescope config
--------------------------------------------------

map("n", "<C-f>", ":lua require('telescope.builtin').find_files()<CR>", opt)
map("n", "<C-p>", ":lua require('telescope.builtin').live_grep()<CR>", opt)
map("n", "<C-b>", ":lua require('telescope.builtin').buffers()<CR>", opt)
map("n", "<C-e>", ":lua require('telescope.builtin').oldfiles()<CR>", opt)
-- Lists all branches with log preview, checkout action <cr>, track action <C-t> and rebase action<C-r>
-- map("n", "<leader>gb", ":lua require('telescope.builtin').git_branches()<CR>", opt)
-- map("n", "<leader>gc", ":lua require('telescope.builtin').git_commits()<CR>", opt)
-- map("n", "<leader>fh", ":lua require('telescope.builtin').help_tags()<CR>", opt)
-- map("n", "<leader>lm", ":lua require('telescope.builtin').marks()<CR>", opt)
-- map("n", "<leader>lk", ":lua require('telescope.builtin').keymaps()<CR>", opt)

-- map("n", "gr", ":lua require('telescope.builtin').lsp_references()<CR>", opt)
map("n", "<C-L>", ":Telescope projects<CR>", opt)


--------------------------------------------------
-- symbols-outline
--------------------------------------------------

map("n", "<A-n>", ":SymbolsOutline<CR>", opt)



--------------------------------------------------
-- git
--------------------------------------------------
map("n", "<leader>gd", ":Gvdiffsplit<CR>", opt)
map("n", "<leader>gb", ":Git blame<CR>", opt)
map("n", "<leader>G", ":G<CR>", opt)



--------------------------------------------------
-- nvim checker
--------------------------------------------------
map("n", "<leader>cl", ':lua require"nvim-checker".clippy()<CR>', opt)
map("n", "<leader>ch", ':lua require"nvim-checker".check()<CR>', opt)
map("n", "<leader>ct", ':lua require"nvim-checker".test()<CR>', opt)




--------------------------------------------------
-- trouble(wip)
--------------------------------------------------
map("n", "<leader>xx", ":TroubleToggle<cr>", opt)
map("n", "<leader>xw", ":TroubleToggle workspace_diagnostics<cr>", opt)
map("n", "<leader>xd", ":TroubleToggle document_diagnostics<cr>", opt)
map("n", "<leader>xl", ":TroubleToggle loclist<cr>", opt)
map("n", "<leader>xq", ":TroubleToggle quickfix<cr>", opt)
map("n", "gR", ":TroubleToggle lsp_references<cr>", opt)
