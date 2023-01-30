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

return {
	{
		"phaazon/hop.nvim",
		tag = "v1.3.0",
		event = "BufEnter",
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
		event = "BufEnter",
		config = function()
		end,
	},
	{
		"numToStr/Comment.nvim",
		event = "BufEnter",
		config = true,
	},
	{
		"windwp/nvim-autopairs",
		event = "BufEnter",
		config = true,
	},
	{
		"nvim-zh/better-escape.vim",
		event = "BufEnter",
		config = function()
		end
	},
	{
		"RRethy/vim-illuminate",
		event = "BufEnter",
		config = illuminate,
	}
}
