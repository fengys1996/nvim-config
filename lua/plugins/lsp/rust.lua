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
		checkOnSave = {
			-- If project is very large, it may take a long time, so it
			-- is recommended to disable it when your project is very large.
			enable = true,
			command = "check",
			-- allTargets = false,
			-- extraArgs = { "--target", "riscv64gc-unknown-none-elf" },
		},
		procMacro = {
			enable = true,
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
local capabilities = require('cmp_nvim_lsp').default_capabilities()

local server_opt = {
	standalone = false,
	settings = rust_analyzer_settings,
	capabilities = capabilities,
	on_attach = server_on_attach,
	root_dir = function(filename)
		return require('rustaceanvim.cargo').get_root_dir(filename);
	end,
	loodrvscode_settings = true,
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
