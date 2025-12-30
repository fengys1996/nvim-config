return {
    {
        "mangelozzi/rgflow.nvim",
        event = "VeryLazy",
        config = function()
            require('rgflow').setup
            {
                cmd_flags = "--smart-case --fixed-strings --ignore --max-columns 200",
                default_trigger_mappings = true,
                default_ui_mappings = true,
                default_quickfix_mappings = true,
            }
        end
    },
    {
        "ibhagwan/fzf-lua",
        -- optional for icon support
        dependencies = { "nvim-tree/nvim-web-devicons" },
        -- or if using mini.icons/mini.nvim
        -- dependencies = { "nvim-mini/mini.icons" },
        ---@module "fzf-lua"
        ---@type fzf-lua.Config|{}
        ---@diagnostic disable: missing-fields
        opts = {}
        ---@diagnostic enable: missing-fields
    }
}
