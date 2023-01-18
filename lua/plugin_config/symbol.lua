local status, symbols_outline = pcall(require, "symbols-outline")
if not status then
	vim.notify("not found symbols-outline")
	return
end

local opts = {
	highlight_hovered_item = false,
	auto_preview = false,
	show_relative_numbers = true,
	keymaps = {
		close = { "<Esc>", "q" },
		goto_location = "<Cr>",
		focus_location = "o",
		hover_symbol = "<C-space>",
		toggle_preview = "K",
		rename_symbol = "r",
		code_actions = "a",
		fold = "h",
		unfold = "l",
		fold_all = "W",
		unfold_all = "E",
		fold_reset = "R",
	},
}

symbols_outline.setup(opts);
