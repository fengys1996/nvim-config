return {
    {
        'fengys1996/rustaceanvim',
        branch = 'fix/standalone-support',
        -- 'mrcjkb/rustaceanvim',
        -- dir = '/home/fys/projects/rustaceanvim',
        -- version = '^6',
        ft = { 'rust' },
        config = function()
            require('plugins.lsp.rust').setup()
        end
    },
    {
        "williamboman/mason.nvim",
        cmd = "Mason",
        opts = {
            install_root_dir = require("config").language_server_bin_path,
            -- PATH = "append",
        }
    },
    {
        "saecki/crates.nvim",
        dependencies = "nvim-lua/plenary.nvim",
        event = { "BufRead Cargo.toml" },
        tag = "v0.7.1",
        config = function()
            require('crates').setup({})
            require('crates').hide()
        end
    },
}
