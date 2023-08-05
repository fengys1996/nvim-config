module = {}

vim.api.nvim_create_user_command('Proj', 'Telescope projects', {})
vim.api.nvim_create_user_command('Projm', 'edit ~/.local/share/nvim/project_nvim/project_history', {})

function module.live_grep_in_path(path)
	local _path = path or vim.fn.input("Dir: ", "", "dir")
	require("telescope.builtin").live_grep({ search_dirs = { _path } })
end

vim.api.nvim_create_user_command('Rgpath', 'lua require("command").live_grep_in_path()', {})

return module
