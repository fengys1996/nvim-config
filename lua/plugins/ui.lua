-- local config = require "config"
local opts = {
	options = {
		-- options: nord, tokyonight
		theme = "auto",
		component_separators = { left = "|", right = "|" },
		globalstatus = true,
		section_separators = { left = " ", right = "" },
	},
	extensions = { "nvim-tree", "toggleterm" },
	sections = {
		lualine_c = {
			{
				'filename',
				file_status = true,
				path = 2,
				short_target = 40,
				symbols = {
					modified = '[+]', -- Text to show when the file is modified.
					readonly = '[-]', -- Text to show when the file is non-modifiable or readonly.
					unnamed = '[No Name]', -- Text to show for unnamed buffers.
				}
			},
			{
				"lsp_progress",
				spinner_symbols = { " ", " ", " ", " ", " ", " " },
			},
		},
		lualine_x = {
			"filesize",
			{
				"fileformat",
				symbols = {
					unix = "LF",
					dos = "CRLF",
					mac = "CR",
				},
			},
			"encoding",
			"filetype",
		},
	},
	tabline = {
		lualine_b = {
			{
				'filename',
				file_status = true,
				path = 2,
				short_target = 40,
				symbols = {
					modified = '[+]', -- Text to show when the file is modified.
					readonly = '[-]', -- Text to show when the file is non-modifiable or readonly.
					unnamed = '[No Name]', -- Text to show for unnamed buffers.
				}
			},
		},
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
};

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
		config = function()
		end,
	},
	{
		"danilamihailov/beacon.nvim",
		enabled = false,
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
