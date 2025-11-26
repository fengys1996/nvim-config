local keys = {
    {
        "<leader>xx",
        "<cmd>Trouble diagnostics toggle<cr>",
        desc = "Diagnostics (Trouble)",
    },
}

local opts = {
    -- follow = false,
    -- win = {
    --     position = "right",
    --     size = math.floor(vim.o.columns * 0.25),
    -- },
    modes = {
        test = {
            mode = "diagnostics",
            preview = {
                type = "split",
                relative = "win",
                position = "right",
                size = 0.3,
            },
        },
    },
}

return {
    {
        "folke/trouble.nvim",
        event = "VeryLazy",
        dependencies = { "kyazdani42/nvim-web-devicons" },
        keys = keys,
        opts = opts,
    },
}
