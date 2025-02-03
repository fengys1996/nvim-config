local opts = {
	size = function(term)
		if term.direction == "horizontal" then
			return vim.o.lines * 0.3
		elseif term.direction == "vertical" then
			return vim.o.columns * 0.5
		end
	end,
	shell = "fish",
	start_in_insert = false,
	shade_terminals = false,
};

local keys = {
	{ "<leader>t", ":ToggleTerm direction=horizontal<CR>" },
}

return {
	{
		'akinsho/toggleterm.nvim',
		version = "v2.13.1",
		keys = keys,
		opts = opts,
	},
}
