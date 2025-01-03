local core_conf_files = {
	"globals.vim",
}

-- source all the core config files
for _, name in ipairs(core_conf_files) do
	local path = string.format("%s/vimscript/%s", vim.fn.stdpath('config'), name)
	local source_cmd = "source " .. path
	vim.cmd(source_cmd)
end

vim.g.nvim7 = (vim.version().minor == 7)

require("basic")
require("keymap.basic")
require("neovide")

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

require("lazy").setup("plugins")

require("cmd.base")
