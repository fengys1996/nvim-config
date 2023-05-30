return {
	-- nord
	{
		-- "shaunsingh/nord.nvim",
		"Fengys123/nord.nvim",
		-- enabled = false,
		lazy = false,
		priority = 1000,
		config = function()
			vim.g.nord_contrast = false
			vim.g.nord_borders = false
			vim.g.nord_disable_background = true
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
		config = function()
			vim.cmd([[colorscheme tokyonight-storm]])
		end
	}
}
