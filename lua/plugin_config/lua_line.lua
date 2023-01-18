local status, lualine = pcall(require, "lualine")
if not status then
	vim.notify("Not found lualine")
	return
end

lualine.setup({
	options = {
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
})
