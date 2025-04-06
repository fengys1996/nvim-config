local adapters_config = {
	copilot = function()
		return require("codecompanion.adapters").extend("copilot", {
			schema = {
				model = {
					default = "claude-3.7-sonnet",
				},
			},
		})
	end,
	deepseek = function()
		return require("codecompanion.adapters").extend("deepseek", {
			env = {
				api_key = "DEEPSEEK_API_KEY",
			},
		})
	end,
}

return {
	{
		'MeanderingProgrammer/render-markdown.nvim',
		ft = { "markdown", "codecompanion" },
		dependencies = { 'nvim-treesitter/nvim-treesitter' },
		opts = {
			render_modes = true,
			sign = {
				enabled = false,
			},
		},
	},
	{
		"olimorris/codecompanion.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
		},
		keys = {
			{
				"<leader>k",
				function()
					require("codecompanion").toggle()
				end,
				desc = "Toggle Code Companion",
			},
		},
		opts = {
			adapters = adapters_config,
			strategies = {
				chat = { adapter = "copilot" },
				inline = { adapter = "copilot" },
			},
		}
	}
}
