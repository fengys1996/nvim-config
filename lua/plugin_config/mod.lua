-- require 'plugin_config.dashboard'

-- storm/day/moon/night
require('tokyonight').setup({
	style = "storm"
})
local colorscheme = 'tokyonight'
local status_ok, _ = pcall(vim.cmd, 'colorscheme ' .. colorscheme)
if not status_ok then
	vim.notify('colorscheme ' .. colorscheme .. ' not found! ')
	return
end

require 'plugin_config.lua_line'
require 'plugin_config.mason'
require 'plugin_config.cmp'
require 'plugin_config.telescope'
require 'plugin_config.projection'
require 'plugin_config.nvim_tree'
require 'plugin_config.symbol'
require 'plugin_config.treesitter'
require 'plugin_config.ufo'
-- require 'plugin_config.session_manager'
require 'plugin_config.lsp.clangd'
require 'plugin_config.lsp.rust'
require 'plugin_config.lsp.lua'
require 'plugin_config.gitsigns'
require 'plugin_config.org'

require('Comment').setup()
require('hop').setup()
require("trouble").setup()
