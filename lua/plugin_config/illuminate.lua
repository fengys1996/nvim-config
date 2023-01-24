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
