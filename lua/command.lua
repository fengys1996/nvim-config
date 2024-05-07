module = {}

vim.api.nvim_create_user_command('Proj', 'Telescope projects', {})
vim.api.nvim_create_user_command('Projm', 'edit ~/.local/share/nvim/project_nvim/project_history', {})

function module.live_grep_in_path(path)
	local _path = path or vim.fn.input("Dir: ", "", "dir")
	require("telescope.builtin").live_grep({ search_dirs = { _path } })
end

vim.api.nvim_create_user_command('Rgpath', 'lua require("command").live_grep_in_path()', {})

vim.api.nvim_create_user_command('Crates', function(opt)
	if string.lower(opt.args) == "toggle" then
		require("crates").toggle()
	end
end, {
	nargs = 1,
	complete = function()
		return { 'toggle' }
	end,
})

vim.api.nvim_create_user_command('ToggleInlayHint',
	'lua vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())', {})

return module
