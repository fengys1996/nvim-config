local tokyonight = {
	transparent = false,
	terminal_colors = true,
}

-- vim.cmd("colorscheme habamax")

return {
	-- nord
	{
		"fengys1996/nord.nvim",
		enabled = true,
		lazy = false,
		priority = 1000,
		config = function()
			vim.g.nord_contrast = false
			vim.g.nord_borders = false
			vim.g.nord_disable_background = false
			vim.g.nord_italic = false
			vim.g.nord_uniform_diff_background = true
			vim.g.nord_bold = false
			-- vim.cmd([[colorscheme nord]])
		end,
	},
	-- tokyonight
	{
		"folke/tokyonight.nvim",
		enabled = false,
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
	},
	{
		"fengys1996/nightfox.nvim",
		enabled = true,
		config = function()
			require("nightfox").setup({
				options = {
					transparent = false,
				}
			})
			-- options: nightfox, dayfox, nordfox, dawnfox
			vim.cmd("colorscheme dayfox")
		end,
	},
	{
		'AlexvZyl/nordic.nvim',
		lazy = false,
		priority = 1000,
		config = function()
			-- require 'nordic'.load()
			-- vim.cmd("colorscheme nordic")
		end
	},
}
