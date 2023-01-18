local status, db = pcall(require, "dashboard")
if not status then
	vim.notify("not found dashboard")
	return
end

db.custom_footer = {
	"",
	"",
	"happy code! happy life",
}

db.custom_center = {
	{
		icon = "  ",
		desc = "Projects                            ",
		action = "Telescope projects",
	},
	{
		icon = "  ",
		desc = "Recently files                      ",
		action = "Telescope oldfiles",
	},
	{
		icon = "  ",
		desc = "Edit keybindings                    ",
		action = "edit ~/.config/nvim/lua/keybindings.lua",
	},
	{
		icon = "  ",
		desc = "Edit Projects                       ",
		action = "edit ~/.local/share/nvim/project_nvim/project_history",
	},
	{
		icon = "  ",
		desc = "Edit init.lua                       ",
		action = "edit ~/.config/nvim/init.lua",
	},
}


db.custom_header = {
	[[          ███████╗██╗   ██╗███████╗      ██╗   ██╗██╗███╗   ███╗]],
	[[          ██╔════╝╚██╗ ██╔╝██╔════╝      ██║   ██║██║████╗ ████║]],
	[[          █████╗   ╚████╔╝ ███████╗█████╗██║   ██║██║██╔████╔██║]],
	[[          ██╔══╝    ╚██╔╝  ╚════██║╚════╝╚██╗ ██╔╝██║██║╚██╔╝██║]],
	[[          ██║        ██║   ███████║       ╚████╔╝ ██║██║ ╚═╝ ██║]],
	[[          ╚═╝        ╚═╝   ╚══════╝        ╚═══╝  ╚═╝╚═╝     ╚═╝]],
	[[                                                                         ]],
	[[                         [ version : 2.0.0 ]                ]],
}
