local kind_icon = {
	text = function(ctx)
		local icon = ctx.kind_icon
		local source_name = vim.fn.toupper(ctx.source_name)
		if vim.tbl_contains({ "PATH" }, source_name) then
			icon = "PAT"
		end
		if vim.tbl_contains({ "LSP" }, source_name) then
			icon = "LSP"
		end
		if vim.tbl_contains({ "BUFFER" }, source_name) then
			icon = "BUF"
		end
		if vim.tbl_contains({ "SNIPPETS" }, source_name) then
			icon = "SNI"
		end

		return icon .. ctx.icon_gap
	end,
};

return {
	'saghen/blink.cmp',
	-- optional: provides snippets for the snippet source
	dependencies = {
		'rafamadriz/friendly-snippets',
	},

	-- use a release tag to download pre-built binaries
	version = '1.*',
	-- AND/OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
	-- build = 'cargo build --release',
	-- If you use nix, you can build from source using latest nightly rust with:
	-- build = 'nix run .#build-plugin',

	opts = {
		-- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
		-- 'super-tab' for mappings similar to vscode (tab to accept)
		-- 'enter' for enter to accept
		-- 'none' for no mappings
		--
		-- All presets have the following mappings:
		-- C-space: Open menu or open docs if already open
		-- C-n/C-p or Up/Down: Select next/previous item
		-- C-e: Hide menu
		-- C-k: Toggle signature help (if signature.enabled = true)
		--
		-- See :h blink-cmp-config-keymap for defining your own keymap
		keymap = {
			preset = 'none',
			['<C-k>'] = { 'select_prev', 'fallback_to_mappings' },
			['<C-j>'] = {
				function(cmp)
					if cmp.is_ghost_text_visible() and not cmp.is_menu_visible() then
						return cmp
							.accept()
					end
				end,
				'show_and_insert',
				'select_next',
			},
			['<C-u>'] = { 'scroll_documentation_up', 'fallback' },
			['<C-d>'] = { 'scroll_documentation_down', 'fallback' },
			['<C-e>'] = { 'hide', "show" },
			['<C-y>'] = { 'accept', "fallback" },
			['<CR>'] = { 'accept', 'fallback' },
			['<Tab'] = {},
		},

		appearance = {
			-- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
			-- Adjusts spacing to ensure icons are aligned
			nerd_font_variant = 'mono'
		},

		completion = {
			documentation = { auto_show = false },
			ghost_text = { enabled = false },
			list = {
				selection = {
					preselect = function(_)
						local is_nvim_tree = vim.bo.filetype == 'NvimTree'
						local is_dressing = vim.bo.filetype == 'DressingInput'

						return not is_nvim_tree and not is_dressing
					end,
					auto_insert = false
				},
			},
			menu = {
				draw = {
					components = {
						kind_icon = kind_icon,
					}
				}
			},
		},

		-- Default list of enabled providers defined so that you can extend it
		-- elsewhere in your config, without redefining it, due to `opts_extend`
		sources = {
			default = { 'lsp', 'buffer', 'snippets', 'path' },
			providers = {
				path = {
					opts = {
						show_hidden_files_by_default = true,
					}
				},
			}
		},

		-- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
		-- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
		-- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
		--
		-- See the fuzzy documentation for more information
		fuzzy = { implementation = "prefer_rust_with_warning" },

		cmdline = {
			enabled = true,
			sources = function()
				local type = vim.fn.getcmdtype()
				if type == '/' or type == '?' then return { 'buffer' } end
				if type == ':' or type == '@' then return { 'cmdline', 'path', 'buffer' } end
				return {}
			end,
			keymap = {
				preset = 'none',
				['<Tab>'] = {
					function(cmp)
						if cmp.is_ghost_text_visible() and not cmp.is_menu_visible() then
							return cmp
								.accept()
						end
					end,
					'show_and_insert',
					'select_next',
				},
				['<S-Tab>'] = { 'show_and_insert', 'select_prev' },
				['<C-j>'] = {
					function(cmp)
						if cmp.is_ghost_text_visible() and not cmp.is_menu_visible() then
							return cmp
								.accept()
						end
					end,
					'show_and_insert',
					'select_next',
				},
				['<C-k>'] = { 'select_prev', 'fallback' },
				['<C-y>'] = { 'select_and_accept' },
				['<C-e>'] = { 'hide', "show" },
			},
			completion = { menu = { auto_show = true } },
		},
	},

	opts_extend = { "sources.default" }
}
