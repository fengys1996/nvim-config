local colorscheme = "nord"

if colorscheme == "tokyonight"
then
	local status_1, tokyonight = pcall(require, "tokyonight")
	if not status_1 then
		vim.notify("not found tokyonight")
	end

	-- storm/day/moon/night
	tokyonight.setup({
		style = "day",
		transparent = false,
		styles = {
			sidebars = "transparent", -- style for sidebars, see below
		},
		sidebars = { "qf", "help", "NvimTree", "Outline" },
	})
end

if colorscheme == "gruvbox"
then
	vim.o.background = "light"
end

if colorscheme == "nord"
then
	vim.g.nord_contrast = true
	vim.g.nord_borders = false
	vim.g.nord_disable_background = false
	vim.g.nord_italic = false
	vim.g.nord_uniform_diff_background = true
	vim.g.nord_bold = false
end

local status_2, _ = pcall(vim.cmd, 'colorscheme ' .. colorscheme)
if not status_2 then
	vim.notify('colorscheme ' .. colorscheme .. ' not found! ')
	return
end
