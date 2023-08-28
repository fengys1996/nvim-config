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
		enabled = true,
		config = function()
			vim.cmd("colorscheme kanagawa-lotus")
		end
	}
}
