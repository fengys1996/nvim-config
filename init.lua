-- base config of neovim
require("basic")

-- plugin manager(dir: ~/.local/share/nvim/site/pack/packer/start)
require("plugins")

-- theme config
require("colorscheme")

-- plugin config
require("plugin-config.nvim-tree")
require("plugin-config.lualine")
require("plugin-config.bufferline")
require("plugin-config.telescope")
require("plugin-config.dashboard")
-- ~/.local/share/nvim/project_nvim/project_history : recent project history
require("plugin-config.project")
require("plugin-config.nvim-treesitter")
require("plugin-config.indent-blankline")
require("plugin-config.comment")
require('lsp.setup')
require('lsp.cmp')
require('lsp.ui')
