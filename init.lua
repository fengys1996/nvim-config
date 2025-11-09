require("vimload")
require("base")
require("keymap.basic")
require("lazy_c")

-- vim.o.background = "dark"
-- vim.cmd("colorscheme everforest")
vim.cmd("colorscheme dayfox")
-- vim.cmd("colorscheme gruvbox")
if vim.g.colors_name == "everforest" then
    vim.cmd("hi SignColumn ctermbg=59 guibg=#505050")
end
-- Since https://github.com/neovim/neovim/pull/32383
-- vim.cmd("hi link qftext LineNr")

require("cmd.base")
require("custom.colorcolumn").setup()

vim.o.runtimepath = vim.o.runtimepath .. "," .. "/home/fys/.config/nvim-rs"
require("neovide")
require("lspinit")
