local module = {}

local auto_attach = false

local function is_auto_attach()
    return auto_attach
end

function module.enable_auto_attach()
    auto_attach = true
end

function module.disable_auto_attach()
    auto_attach = false
end

local function prefer_roots()
    -- Speed up Cargo workspace root detection and correctly identify the root
    -- in projects with Git submodules.
    return {
        "/home/fys/projects/greptimedb-enterprise/",
        "/home/fys/projects/greptimedb/",
        -- Add paths to your frequently used Cargo projects here.
    }
end

local ra_settings = {
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
            -- allFeatures = true,
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

local server_on_attach = function(_, _)
    -- do nothing
end

local capabilities = require('blink.cmp').get_lsp_capabilities()

-- It seems a stable rust-analyzer build (2025-08-25).
-- local stable_ra = "/home/fys/soft/rust-analyzer/ra-25-08-25"

local enable_lspmux = false

local server_opt = {
    standalone = false,
    settings = ra_settings,
    capabilities = capabilities,
    on_attach = server_on_attach,
    load_vscode_settings = true,
    auto_attach = is_auto_attach,
    root_dir = function(file_name, default_func)
        for _, root in ipairs(prefer_roots()) do
            -- Escape hyphens for pattern matching
            local escaped_root = root:gsub("%-", "%%-")
            if string.find(file_name, escaped_root) then
                return root
            end
        end

        return default_func(file_name);
    end,
    lspmux = {
        enable = false,
    },
    cmd = function()
        if enable_lspmux and vim.fn.executable("lspmux") == 1 then
            return {
                vim.fn.exepath("lspmux"),
                "client",
                "--server-path",
                vim.fn.exepath("rust-analyzer")
            }
        else
            return {
                vim.fn.exepath("rust-analyzer")
                -- Or
                -- stable_ra
                -- Configure the log file for making it easier to debug the server
                -- if needed.
                -- '--log-file',
                -- '/tmp/ra.log'
            }
        end
    end
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
