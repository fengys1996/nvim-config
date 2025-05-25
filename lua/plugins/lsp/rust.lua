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
			-- command = "check",
			-- If false, -p <package> will be passed instead if applicable.
			-- workspace = false,
			-- extraArgs = { "-j", "6" },
			-- allTargets = false,
			-- extraArgs = { "--target", "riscv64gc-unknown-none-elf" },
		},
		-- numThreads = 8,
		cargo = {
			-- autoreload = false,
			-- 	-- targetDir = true,
			-- 	buildScripts = {
			-- 		rebuildOnSave = false,
			-- 	},
		},
		-- procMacro = {
		-- 	enable = false,
		-- },
		-- lens = {
		-- 	enable = false,
		-- },
		-- lru = {
		-- 	capacity = 512,
		-- },
		-- diagnostics = {
		-- 	enable = false,
		-- },
	},
}

local server_on_attach = function(_client, _bufnr)
	-- do nothing
end

local capabilities = require('blink.cmp').get_lsp_capabilities()

local server_opt = {
	standalone = false,
	settings = rust_analyzer_settings,
	-- default_settings = rust_analyzer_settings,
	capabilities = capabilities,
	on_attach = server_on_attach,
	load_vscode_settings = true,
	auto_attach = is_auto_attach,
	root_dir = function(file_name, default_func)
		local db_ent = string.find(file_name, "/home/fys/source/greptimedb%-enterprise/")
		if db_ent then
			return "/home/fys/source/greptimedb-enterprise/"
		end

		local db = string.find(file_name, "/home/fys/projects/greptimedb/")
		if db then
			return "/home/fys/projects/greptimedb/"
		end

		return default_func(file_name);
	end
	-- cmd = function()
	-- 	return { '/home/fys/projects/rust-analyzer/target/release/rust-analyzer', '--log-file', '/tmp/ra.log' }
	-- end,
}

function module.setup()
	vim.g.rustaceanvim = {
		tools = {
			executor = "termopen",
			test_executor = "termopen",
			-- reload_workspace_from_cargo_toml = false,
		},
		server = server_opt,
	}
end

return module
