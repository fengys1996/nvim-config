local illuminate = function()
	local status, illuminate = pcall(require, "illuminate")
	if not status then
		vim.notify("not found illuminate")
	end

	illuminate.configure({
		-- ordered by priority
		providers = {
			'lsp',
			'treesitter',
			'regex',
		},
		-- milliseconds
		delay = 100,
		filetype_overrides = {},
		filetypes_denylist = {
			'dirvish',
			'fugitive',
			'NvimTree',
			'qf',
			'Outline',
		},
		filetypes_allowlist = {},
		modes_denylist = {},
		modes_allowlist = {},
		providers_regex_syntax_denylist = {},
		providers_regex_syntax_allowlist = {},
		under_cursor = true,
		large_file_cutoff = 10000,
		large_file_overrides = nil,
		min_count_to_highlight = 2,
	})
end

local symbols = {
	highlight_hovered_item = true,
	auto_preview = false,
	show_relative_numbers = true,
	width = 20,
	keymaps = {
		close = { "<Esc>", "q" },
		goto_location = "<Cr>",
		focus_location = "o",
		hover_symbol = "<C-space>",
		toggle_preview = "K",
		rename_symbol = "r",
		code_actions = "a",
		fold = "h",
		unfold = "l",
		fold_all = "W",
		unfold_all = "E",
		fold_reset = "R",
	},
}

local imselect = {
	default_im_select       = "keyboard-us",

	set_default_events      = { "VimEnter", "FocusGained", "InsertLeave", "CmdlineLeave" },

	set_previous_events     = { "InsertEnter" },

	keep_quiet_on_no_binary = false
}

return {
	{
		"phaazon/hop.nvim",
		tag = "v1.3.0",
		event = "VeryLazy",
		keys = {
			{ "f",
				"<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true })<cr>" },
			{ "F",
				"<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })<cr>" },
			{ "s", "<cmd>HopChar2AC<cr>" },
			{ "S", "<cmd>HopChar2BC<cr>" },
		},
		config = true,
	},
	{
		"tpope/vim-surround",
		event = "VeryLazy",
		config = function()
		end,
	},
	{
		"numToStr/Comment.nvim",
		event = "VeryLazy",
		config = true,
	},
	{
		"windwp/nvim-autopairs",
		event = "VeryLazy",
		config = true,
	},
	{
		"nvim-zh/better-escape.vim",
		event = "VeryLazy",
		config = function()
		end
	},
	{
		"RRethy/vim-illuminate",
		event = { "BufReadPost", "BufNewFile" },
		config = illuminate,
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		enabled = false,
		event = "VeryLazy",
		config = function()
		end
	},
	{
		"simrat39/symbols-outline.nvim",
		keys = {
			{ "<A-n>", "<cmd>SymbolsOutline<cr>", mode = { "n", "i", "t" } },
		},
		event = "VeryLazy",
		opts = symbols,
	},
	{
		"keaising/im-select.nvim",
		opts = imselect,
	}
}
