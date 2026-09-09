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

vim.api.nvim_create_user_command("ToggleCopilot", function()
    toggle_complete()
end, {}
)

local acp_config = {
    codex = function()
        return require("codecompanion.adapters").extend("codex", {
            defaults = {
                auth_method = "chatgpt",
            },
        })
    end,
};

return {
    {
        "olimorris/codecompanion.nvim",
        enabled = false,
		version = "v17.33.0",
        lazy = true,
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope.nvim",
        },
        config = function()
            require("codecompanion").setup(
                {
                    adapters = {
                        http = adapters_config,
                        acp = acp_config,
                    },
                    strategies = {
                        chat = { adapter = "copilot" },
                        inline = { adapter = "copilot" },
                    },
                })
            set_cc_keymap()
        end
    }
}
