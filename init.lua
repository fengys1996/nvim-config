local core_conf_files = {
    "globals.vim",
}

-- source all the core config files
for _, name in ipairs(core_conf_files) do
    local path = string.format("%s/vimscript/%s", vim.fn.stdpath('config'), name)
    local source_cmd = "source " .. path
    vim.cmd(source_cmd)
end

require("basic")
require("keymap.basic")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    spec = {
        { import = "plugins" },

    },
    change_detection = {
        enabled = false,
        notify = false,
    },
    checker = {
        enabled = false,
        notify = false,
    },
})

vim.o.background = "dark"
vim.cmd("colorscheme everforest")
if vim.g.colors_name == "everforest" then
    vim.cmd("hi SignColumn ctermbg=59 guibg=#505050")
end
-- Since https://github.com/neovim/neovim/pull/32383
vim.cmd("hi link qftext LineNr")


require("cmd.base")

require("custom.colorcolumn").setup()

vim.o.runtimepath = vim.o.runtimepath .. "," .. "/home/fys/.config/nvim-rs"
require("neovide")
require("lspinit")
