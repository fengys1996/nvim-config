local opts = {
	size = function(term)
		if term.direction == "horizontal" then
			return vim.o.lines * 0.3
		elseif term.direction == "vertical" then
			return vim.o.columns * 0.5
		end
	end,
	-- open_mapping = [[<c-\>]],
	shell = "fish",
	start_in_insert = false,
	shade_terminals = false,
};

return {
	{
		'akinsho/toggleterm.nvim',
		version = "*",
		opts = opts,
	},
}
