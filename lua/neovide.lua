if vim.g.is_neovide then
	vim.g.neovide_cursor_animation_length = 0
	vim.g.neovide_scroll_animation_far_lines = 0
	vim.g.neovide_cursor_animate_in_insert_mode = true

	vim.g.neovide_cursor_trail_size = 0.4

	if vim.g.is_mac then
		vim.g.neovide_input_macos_alt_is_meta = true
	end

	vim.g.neovide_transparency = 1

	vim.g.neovide_hide_mouse_when_typing = true

	vim.g.neovide_confirm_quit = true

	-- vim.o.guifont = "GoMono_Nerd_Font:h10:b"  'b' mean: bold
	-- font style.  'i' mean: font italic style
	-- vim.o.guifont = "JetBrains_Mono:h9"
	vim.o.guifont = "Monaspicekr_Nerd_Font:h10"
	vim.opt.linespace = 2

	vim.g.neovide_text_gamma = 0.0
	vim.g.neovide_text_contrast = 0.5
end
