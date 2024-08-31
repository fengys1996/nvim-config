local module = {}

local capabilities = require('cmp_nvim_lsp').default_capabilities()

local rust_analyzer_settings = {
	["rust-analyzer"] = {
		-- The server path would be overriden by mason-lspconfig.nvim.
		-- server = {
		-- 	path = "/home/fys/.cargo/bin/rust-analyzer",
		-- },
		checkOnSave = {
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

local server_opt = {
	standalone = false,
	settings = rust_analyzer_settings,
	capabilities = capabilities,
	on_attach = server_on_attach,
	root_dir = function(filename)
		return require('rustaceanvim.cargo').get_root_dir(filename);
	end,
	loodrvscode_settings = true,
	auto_attach = function()
		return false
	end,
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
