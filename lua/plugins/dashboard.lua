local opts = {
	theme = "hyper",
	config = {
		header =
		{
			"██╗  ██╗███████╗██╗     ██╗      ██████╗        ███████╗██╗   ██╗███████╗",
			"██║  ██║██╔════╝██║     ██║     ██╔═══██╗       ██╔════╝╚██╗ ██╔╝██╔════╝",
			"███████║█████╗  ██║     ██║     ██║   ██║       █████╗   ╚████╔╝ ███████╗",
			"██╔══██║██╔══╝  ██║     ██║     ██║   ██║       ██╔══╝    ╚██╔╝  ╚════██║",
			"██║  ██║███████╗███████╗███████╗╚██████╔╝▄█╗    ██║        ██║   ███████║",
			"╚═╝  ╚═╝╚══════╝╚══════╝╚══════╝ ╚═════╝ ╚═╝    ╚═╝        ╚═╝   ╚══════╝",
		},
		footer = {
			"", "Happy coding! Happy life!"
		},
		shortcut = {
			{ desc = '[  Github]', group = 'DashboardShortCut' },
			{ desc = '[  fys]', group = 'DashboardShortCut' },
			{ desc = '[  2.0]', group = 'DashboardShortCut' },
		},
	},
};

return {
	{
		"glepnir/dashboard-nvim",
		enabled = false,
		dependencies = { "kyazdani42/nvim-web-devicons" },
		event = 'VimEnter',
		opts = opts,
	}
}
