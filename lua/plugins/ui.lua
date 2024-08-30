local opts = {
	options = {
		theme = "auto",
		component_separators = { left = "|", right = "|" },
		globalstatus = true,
		section_separators = { left = " ", right = "" },
	},
};

local bqf_opts = {
	func_map = {
		open = '<CR>',
		openc = 'o',
		drop = 'O',
		split = '<C-x>',
		vsplit = '<C-v>',
		splitc = '<C-n>',
		vsplitc = '<C-b>',
		tab = 't',
		tabb = 'T',
		tabc = '<C-t>',
		tabdrop = '',
		ptogglemode = 'zp',
		ptoggleitem = 'p',
		ptoggleauto = 'P',
		pscrollup = '<C-b>',
		pscrolldown = '<C-f>',
		pscrollorig = 'zo',
		prevfile = '<C-p>',
		nextfile = '<C-n>',
		prevhist = '<',
		nexthist = '>',
		lastleave = [['"]],
		stoggleup = '<S-Tab>',
		stoggledown = '<Tab>',
		stogglevm = '<Tab>',
		stogglebuf = [['<Tab>]],
		sclear = 'z<Tab>',
		filter = 'zn',
		filterr = 'zN',
		fzffilter = 'zf'
	},
}

local dressing_opt = {
	input = {
		insert_only = false,
		start_in_insert = true,
	}
}

return {
	{
		"nvim-lualine/lualine.nvim",
		event = "VeryLazy",
		dependencies = { "kyazdani42/nvim-web-devicons", "arkav/lualine-lsp-progress", },
		opts = opts,
	},
	{
		"stevearc/dressing.nvim",
		enabled = true,
		opts = dressing_opt,
	},
	{
		"danilamihailov/beacon.nvim",
		enabled = true,
		config = function()
		end
	},
	{
		"lewis6991/satellite.nvim",
		enabled = false,
		config = true,
	},
	{
		"Fengys123/nvim-bqf",
		config = function()
			require("bqf").setup(bqf_opts);
		end
	},
	{
		"folke/noice.nvim",
		enabled = false,
		event = "VeryLazy",
		opts = {
		},
		dependencies = {
			"MunifTanjim/nui.nvim",
			"rcarriga/nvim-notify",
		}
	}
}
