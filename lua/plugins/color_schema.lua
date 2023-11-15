local tokyonight = {
	transparent = false,
	terminal_colors = true,
}

return {
	-- nord
	{
		-- "shaunsingh/nord.nvim",
		"Fengys123/nord.nvim",
		enabled = false,
		lazy = false,
		priority = 1000,
		config = function()
			vim.g.nord_contrast = false
			vim.g.nord_borders = false
			vim.g.nord_disable_background = false
			vim.g.nord_italic = false
			vim.g.nord_uniform_diff_background = true
			vim.g.nord_bold = false
			vim.cmd([[colorscheme nord]])
		end,
	},
	-- tokyonight
	{
		"folke/tokyonight.nvim",
		enabled = true,
		lazy = false,
		priority = 1000,
		-- opts = tokyonight,
		config = function()
			require("tokyonight").setup(tokyonight);
			vim.cmd([[colorscheme tokyonight-day]])
		end
	},
	-- kanagawa
	{
		"rebelot/kanagawa.nvim",
		enabled = false,
		config = function()
			vim.cmd("colorscheme kanagawa-lotus")
		end
	},
	{
		"Mofiqul/vscode.nvim",
		enabled = false,
		config = function()
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
		end,
	}
}
