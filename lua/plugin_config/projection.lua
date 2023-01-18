local status, project = pcall(require, "project_nvim")
if not status then
	vim.notify("not found project_nvim")
	return
end

-- nvim-tree support
project.setup({
	detection_methods = { "pattern" },
	patterns = { ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile", "package.json", ".sln" },
})

local status1, telescope = pcall(require, "telescope")
if not status1 then
	vim.notify("not found telescope")
	return
end
pcall(telescope.load_extension, "projects")
