local opts = {
	options = {
		-- options: nord
		theme = "tokyonight",
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

return {
	{
		"nvim-lualine/lualine.nvim",
		event = "VeryLazy",
		dependencies = { "kyazdani42/nvim-web-devicons", "arkav/lualine-lsp-progress", },
		opts = opts,
	},
	{
		"stevearc/dressing.nvim",
		config = function()
		end,
	},
	{
		"danilamihailov/beacon.nvim",
		config = function()
		end
	}
}
