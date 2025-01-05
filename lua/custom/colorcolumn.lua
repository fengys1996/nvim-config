-- The module for toggling the colorcolumn in the current buffer.

local m = {}

local config = {
	colorcolumn = "80",
}

function m.toggle()
	if vim.wo.colorcolumn == "" then
		vim.wo.colorcolumn = config.colorcolumn
	else
		vim.wo.colorcolumn = ""
	end
end

function m.setup(c)
	c = c or {}
	config = vim.tbl_extend("force", config, c)

	vim.api.nvim_create_user_command(
		'ColorColumnToggle',
		function()
			m.toggle()
		end,
		{}
	)
end

return m
