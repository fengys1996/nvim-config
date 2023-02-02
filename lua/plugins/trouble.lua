local keys = {
	{ "<leader>xx", ":TroubleToggle<cr>" },
}

return {
	{
		"folke/trouble.nvim",
		event = "VeryLazy",
		dependencies = { "kyazdani42/nvim-web-devicons" },
		keys = keys,
		config = function()
		end,
	},
}
