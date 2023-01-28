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

local colorscheme = 'tokyonight'
local status_2, _ = pcall(vim.cmd, 'colorscheme ' .. colorscheme)
if not status_2 then
	vim.notify('colorscheme ' .. colorscheme .. ' not found! ')
	return
end