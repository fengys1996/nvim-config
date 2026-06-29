require("vimload")
require("base")
require("keymap.basic")
require("lazy_c")

-- options:
-- - light
-- - dark
vim.o.background = "light"

-- common theme:
-- - dayfox
-- - everforest
-- - onelight
-- - gruvbox
-- - monokai-pro-light
vim.cmd("colorscheme gruvbox-material")

-- Since https://github.com/neovim/neovim/pull/32383
-- vim.cmd("hi link qftext LineNr")

require("cmd.base")
require("custom.colorcolumn").setup()

vim.o.runtimepath = vim.o.runtimepath .. "," .. require("config").nvim_rs_path
require("neovide")
require("lspinit")
require("ts")
-- require('vim._core.ui2').enable({})
