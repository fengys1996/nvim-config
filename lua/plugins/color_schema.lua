local function everforest_config()
    require("everforest").setup({
        -- Options "soft"/"medium"/"hard".
        background = "medium",
        transparent_background_level = 0,
        italics = false,
        disable_italic_comments = true,
        sign_column_background = "none",
        on_highlights = function(hl, palette)
            hl.NvimTreeCursorLine = { fg = palette.None, bg = palette.gray, sp = palette.none }
            hl.NvimTreeNormal = { fg = palette.none, bg = palette.none, sp = palette.none }
            hl.NvimTreeEndOfBuffer = { fg = palette.none, bg = palette.none, sp = palette.none }
        end,
    })
end

return {
    {
        "ellisonleao/gruvbox.nvim",
        enabled = true,
        lazy = false,
        priority = 1000,
        config = true
    },
    {
        "fengys1996/nightfox.nvim",
        enabled = true,
        lazy = false,
        priority = 1000,
        config = true
    },
    -- kanagawa
    {
        "rebelot/kanagawa.nvim",
        enabled = true,
        lazy = false,
        priority = 1000,
        config = true
    },
    -- everforest
    {
        "neanias/everforest-nvim",
        lazy = false,
        priority = 1000,
        config = everforest_config
    },
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
    },
}
