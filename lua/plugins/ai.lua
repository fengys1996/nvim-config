local set_complete_keymap = function()
    vim.keymap.set('i', '<C-n>', '<Plug>(copilot-next)')
    vim.keymap.set('i', '<C-p>', '<Plug>(copilot-previous)')
    vim.keymap.set('i', '<C-y>', '<Plug>(copilot-accept-word)')
end

local unset_complete_keymap = function()
    vim.keymap.del('i', '<C-n>')
    vim.keymap.del('i', '<C-p>')
    vim.keymap.del('i', '<C-y>')
end

local set_cc_keymap = function()
    vim.keymap.set("n", "<leader>k", ':CodeCompanionChat Toggle<CR>')
end

local copilot_setup = function()
    return require("codecompanion.adapters").extend("copilot", {
        schema = {
            model = {
                default = "gpt-4.1",
            },
        },
    })
end

local ds_setup = function()
    return require("codecompanion.adapters").extend("deepseek", {
        env = {
            api_key = "DEEPSEEK_API_KEY",
        },
    })
end

local adapters_config = {
    copilot = copilot_setup,
    deepseek = ds_setup,
}

local is_enable = false

local toggle_complete = function()
    if is_enable then
        unset_complete_keymap()
        vim.g.copilot_enabled = false
        is_enable = false
        print("copilot disabled ")
    else
        set_complete_keymap()
        vim.g.copilot_enabled = true
        is_enable = true
        print("copilot enabled")
    end
end

vim.api.nvim_create_user_command("ToggleCopilot", function()
    toggle_complete()
end, {}
)

return {
    {
        'MeanderingProgrammer/render-markdown.nvim',
        ft = { "markdown", "codecompanion" },
        dependencies = { 'nvim-treesitter/nvim-treesitter' },
        opts = {
            render_modes = true,
            sign = {
                enabled = false,
            },
        },
    },
    {
        "olimorris/codecompanion.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-treesitter/nvim-treesitter",
        },
        config = function()
            require("codecompanion").setup(
                {
                    adapters = {
                        http = adapters_config,
                    },
                    strategies = {
                        chat = { adapter = "copilot" },
                        inline = { adapter = "copilot" },
                    },
                })
            set_cc_keymap()
        end
    },
    {
        "github/copilot.vim",
        event = "VeryLazy",
        config = function()
            set_complete_keymap()
            vim.g.copilot_enabled = false
        end,
    },
}
