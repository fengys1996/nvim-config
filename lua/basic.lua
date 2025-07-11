--------------------------------------------------
-- vim.g.{name}: global varible
-- vim.b.{name}: buffer varible
-- vim.w.{name}: window varible
-- vim.bo.{name}: buffer-local varible
-- vim.wo:{name}: window-local varible
-- vim.opt:{name}: equals ":set"
--------------------------------------------------

vim.o.tabstop = 4
vim.o.cmdheight = 1
vim.o.shiftwidth=4

vim.o.jumpoptions = "stack"

vim.o.laststatus = 3

-- vim.opt.keymap = "dvorak"
vim.opt.updatetime = 500

vim.g.history = 100000

-- set screen vertical
vim.g.screen_vertical = false

-- set leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- utf8
vim.g.encoding = "UTF-8"
vim.o.fileencoding = 'utf-8'

-- when use jkhl to move, keep 8 lines around the cursor
vim.o.scrolloff = 8
vim.o.sidescrolloff = 8

-- use relative number
vim.wo.number = true
vim.wo.relativenumber = true

-- hightlight the current row
vim.wo.cursorline = true

vim.wo.signcolumn = "yes"

-- right line: If it exceeds, it means that the code is too
-- long, consider wrapping
-- vim.wo.colorcolumn = "80"

-- search is case insensitive, unless uppercase is included
vim.o.ignorecase = true
vim.o.smartcase = true

-- forbid wrap
vim.wo.wrap = false

vim.o.autoread = true
vim.bo.autoread = true

-- window split: window will appear from the right and the
-- bottom
vim.o.splitbelow = true
vim.o.splitright = true

-- style
vim.o.termguicolors = true
vim.opt.termguicolors = true

-- the time(ms) for waitting for keyboard combo
vim.o.timeoutlen = 500

-- always show tableline
vim.o.showtabline = 0

-- disable show vim mode, since using plugin to do
-- vim.o.showmode = true

-- completion displays up to 10 lines
vim.o.pumheight = 15

vim.g.completeopt = "menu,menuone,noselect"

vim.o.backup = false
vim.o.writebackup = false
vim.o.swapfile = false

vim.o.mouse = "a"

-- config of diagnostic
vim.diagnostic.config({
	virtual_text = true,
	signs = true,
	update_in_insert = false,
	underline = true,
})
