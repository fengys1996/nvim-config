require("vimload")
require("base")
require("keymap.basic")
require("lazy_c")

-- vim.o.background = "light"
-- vim.o.background = "background"

vim.cmd("colorscheme onelight")
-- vim.cmd("colorscheme everforest")
-- vim.cmd("colorscheme dayfox")
-- vim.cmd("colorscheme gruvbox")

-- Since https://github.com/neovim/neovim/pull/32383
-- vim.cmd("hi link qftext LineNr")

require("cmd.base")
require("custom.colorcolumn").setup()

vim.o.runtimepath = vim.o.runtimepath .. "," .. "/home/fys/.config/nvim-rs"
require("neovide")
require("lspinit")
