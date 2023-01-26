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
require("plugins")
require("neovide")

require("command")

require("impatient")
require("impatient").enable_profile()

require("plugin_config.mod")
require("keymap.core")
require("keymap.lsp")
