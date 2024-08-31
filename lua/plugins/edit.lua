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

local indent_blankline = {
	enabled = true,
	debounce = 100,
	indent = { char = "▏" },
	whitespace = { highlight = { "Whitespace", "NonText" } },
	scope = { exclude = { language = { "lua" } } },
}

return {
	{
		"smoka7/hop.nvim",
		tag = "v2.5.0",
		event = "VeryLazy",
		keys = {
			{ "s", "<cmd>HopChar2AC<cr>" },
			{ "S", "<cmd>HopChar2BC<cr>" },
		},
		config = function()
			local hop = require('hop')
			local directions = require('hop.hint').HintDirection

			hop.setup()

			vim.keymap.set('', 'f', function()
				hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true })
			end, { remap = true })

			vim.keymap.set('', 'F', function()
				hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true })
			end, { remap = true })

			vim.keymap.set('', 't', function()
				hop.hint_char1({
					direction = directions.AFTER_CURSOR,
					current_line_only = true,
					hint_offset = -1
				})
			end, { remap = true })

			vim.keymap.set('', 'T', function()
				hop.hint_char1({
					direction = directions.BEFORE_CURSOR,
					current_line_only = true,
					hint_offset = 1
				})
			end, { remap = true })
		end
	},
	{
		"tpope/vim-surround",
		event = "VeryLazy",
		config = function()
		end,
	},
	{
		"windwp/nvim-autopairs",
		event = "VeryLazy",
		config = true,
	},
	{
		"TheBlob42/houdini.nvim",
		config = function()
			require('houdini').setup {
				mappings = { 'jk' },
			}
		end,
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
		main = "ibl",
		opts = indent_blankline,
	},
	{
		"simrat39/symbols-outline.nvim",
		enabled = true,
		keys = {
			{ "<A-n>", "<cmd>SymbolsOutline<cr>", mode = { "n", "i", "t" } },
		},
		event = "VeryLazy",
		opts = symbols,
	},
}
