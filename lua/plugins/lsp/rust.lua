local module = {}

local enable_auto_attach = false

local function is_auto_attach()
	return enable_auto_attach
end

function module.enable_auto_attach()
	enable_auto_attach = true
end

function module.disable_auto_attach()
	enable_auto_attach = false
end

local rust_analyzer_settings = {
	["rust-analyzer"] = {
		-- The server path would be overriden by mason-lspconfig.nvim.
		-- server = {
		-- 	-- For example, "/home/fys/.cargo/bin/rust-analyzer".
		-- 	path = "",
		-- },
		-- If project is very large, it may take a long time, so it
		-- is recommended to disable it when your project is very large.
		checkOnSave = false,
		check = {
			command = "check",
			-- If false, -p <package> will be passed instead if applicable.
			workspace = false,
			-- extraArgs = { "-j", "6" },
			-- allTargets = false,
			-- extraArgs = { "--target", "riscv64gc-unknown-none-elf" },
		},
		-- numThreads = 8,
		cargo = {
			targetDir = true,
		},
		procMacro = {
			enable = true,
		},
		lens = {
			enable = false,
		},
		lru = {
			capacity = 512,
		},
	},
}

local server_on_attach = function(_client, bufnr)
	local function mapbuf(...)
		vim.api.nvim_buf_set_keymap(bufnr, ...)
	end

	require("keymap.lsp").maplsp(mapbuf, "rust")
end

-- The nvim-cmp almost supports LSP's capabilities so You should advertise it to LSP servers.
-- local capabilities = require('cmp_nvim_lsp').default_capabilities()

local server_opt = {
	standalone = false,
	settings = rust_analyzer_settings,
	default_settings = rust_analyzer_settings,
	-- capabilities = capabilities,
	-- https://github.com/hrsh7th/cmp-nvim-lsp/issues/72
	capabilities =
	    require("cmp_nvim_lsp").default_capabilities(
		    {
			    resolveSupport = {
				    properties = {
					    "documentation",
					    "detail",
					    "additionalTextEdits",
					    "sortText",
					    "filterText",
					    "insertText",
					    "insertTextFormat",
					    "insertTextMode"
				    }
			    }
		    }
	    ),
	on_attach = server_on_attach,
	root_dir = function(filename)
		return require('rustaceanvim.cargo').get_root_dir(filename);
	end,
	load_vscode_settings = false,
	auto_attach = is_auto_attach,
}

function module.setup()
	vim.g.rustaceanvim = {
		tools = {
			executor = "termopen",
			test_executor = "termopen",
			reload_workspace_from_cargo_toml = true,
		},
		server = server_opt,
	}
end

return module
