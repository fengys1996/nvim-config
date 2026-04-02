require("vimload")
require("base")
require("keymap.basic")
require("lazy_c")

vim.o.background = "light"
-- vim.o.background = "background"

-- common theme:
-- - dayfox
-- - everforest
-- - onelight
-- - gruvbox
-- - monokai-pro-light
vim.cmd("colorscheme dayfox")

-- Since https://github.com/neovim/neovim/pull/32383
-- vim.cmd("hi link qftext LineNr")

require("cmd.base")
require("custom.colorcolumn").setup()

vim.o.runtimepath = vim.o.runtimepath .. "," .. require("config").nvim_rs_path
require("neovide")
require("lspinit")
