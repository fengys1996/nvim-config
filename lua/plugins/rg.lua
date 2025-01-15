return {

	{
		"mangelozzi/rgflow.nvim",
		event = "VeryLazy",
		config = function()
			require('rgflow').setup
			{
				cmd_flags = "--smart-case --fixed-strings --ignore --max-columns 200",
				default_trigger_mappings = true,
				default_ui_mappings = true,
				default_quickfix_mappings = true,
			}
		end
	},
}
