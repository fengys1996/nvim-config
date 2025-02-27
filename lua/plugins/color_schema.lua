local tokyonight_opt = {
	transparent = false,
	terminal_colors = true,
}

local function tokyonight_config()
	require("tokyonight").setup(tokyonight_opt);
end

local function vscode_config()
	local c = require('vscode.colors').get_colors()
	require('vscode').setup({
		style = 'light',
		transparent = false,
		italic_comments = true,
		disable_nvimtree_bg = true,
		color_overrides = {
			vscLineNumber = '#FFFFFF',
		},
		group_overrides = {
			Cursor = { fg = c.vscDarkBlue, bg = c.vscLightGreen, bold = true },
		}
	})
	require('vscode').load()
end

local function nord_config()
	vim.g.nord_contrast = false
	vim.g.nord_borders = false
	vim.g.nord_disable_background = false
	vim.g.nord_italic = false
	vim.g.nord_uniform_diff_background = true
	vim.g.nord_bold = false
end

local function everforest_config()
	require("everforest").setup({
		-- options are "soft", "medium" or "hard".
		background = "medium",
		transparent_background_level = 0,
		italics = false,
		disable_italic_comments = true,
		sign_column_background = "none",
		on_highlights = function(hl, palette)
			hl.NvimTreeCursorLine = { fg = palette.None, bg = palette.gray, sp = palette.none }
			hl.NvimTreeNormal = { fg = palette.none, bg = palette.none, sp = palette.none }
			hl.NvimTreeEndOfBuffer = { fg = palette.none, bg = palette.none, sp = palette.none }
		end,
	})
end

return {
	{
		"ellisonleao/gruvbox.nvim",
		enabled = true,
		lazy = false,
		priority = 1000,
		config = true
	},
	{
		"fengys1996/nightfox.nvim",
		enabled = true,
		lazy = false,
		priority = 1000,
		config = true
	},
	{
		'AlexvZyl/nordic.nvim',
		enabled = true,
		lazy = true,
		config = true
	},
	{
		"Mofiqul/vscode.nvim",
		enabled = true,
		lazy = true,
		config = vscode_config
	},
	{
		"fengys1996/nord.nvim",
		enabled = true,
		lazy = true,
		config = nord_config
	},
	-- tokyonight
	{
		"folke/tokyonight.nvim",
		enabled = true,
		lazy = true,
		config = tokyonight_config
	},
	-- kanagawa
	{
		"rebelot/kanagawa.nvim",
		enabled = true,
		lazy = false,
		priority = 1000,
		config = true
	},
	-- everforest
	{
		"neanias/everforest-nvim",
		lazy = false,
		priority = 1000,
		config = everforest_config
	},
}
