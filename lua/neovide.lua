if vim.g.neovide then
	vim.g.neovide_cursor_animation_length = 0
	vim.g.neovide_scroll_animation_far_lines = 0
	vim.g.neovide_cursor_animate_in_insert_mode = false

	vim.g.neovide_scroll_animation_far_lines = 0
	vim.g.neovide_scroll_animation_length = 0

	vim.g.neovide_cursor_trail_size = 0

	if vim.g.is_mac then
		vim.g.neovide_input_macos_alt_is_meta = true
	end

	vim.g.neovide_hide_mouse_when_typing = false

	vim.g.neovide_confirm_quit = false

	-- vim.o.guifont = "GoMono_Nerd_Font:h10:b"  'b' mean: bold
	-- font style.  'i' mean: font italic style
	-- vim.o.guifont = "JetBrains_Mono:h9"
	-- vim.o.guifont = "Monaspicekr_Nerd_Font:h10"
	vim.opt.linespace = 2
	-- vim.g.neovide_text_gamma = 0.0
	-- vim.g.neovide_text_contrast = 0.5

	-- Select line(s) in visual mode and copy (CTRL+Shift+V)
	vim.api.nvim_set_keymap("v", "<sc-c>", '"+y', { noremap = true })
	-- Paste in insert mode (CTRL+Shift+C)
	vim.api.nvim_set_keymap("i", "<sc-v>", '<ESC>"+p', { noremap = true })
	-- Paste in normal mode (CTRL+Shift+C)
	vim.api.nvim_set_keymap("n", "<sc-v>", '"+p', { noremap = true })
end
