local cc = {}

local config = {
	colorcolumn = "80",
}

function cc.toggle()
	if vim.wo.colorcolumn == "" then
		vim.wo.colorcolumn = config.colorcolumn
	else
		vim.wo.colorcolumn = ""
	end
end

function cc.setup(c)
	c = c or {}
	config = vim.tbl_extend("force", config, c)

	vim.api.nvim_create_user_command(
		'ColorColumnToggle',
		function()
			cc.toggle()
		end,
		{}
	)
end

return cc
