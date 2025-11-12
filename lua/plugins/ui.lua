local function everforest()
    require("everforest").setup({
        -- Options
        -- - soft
        -- - medium
        -- - hard
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

local bqf_opts = {
    func_map = {
        open = '<CR>',
        openc = 'o',
        drop = 'O',
        split = '<C-x>',
        vsplit = '<C-v>',
        splitc = '<C-n>',
        vsplitc = '<C-b>',
        tab = 't',
        tabb = 'T',
        tabc = '<C-t>',
        tabdrop = '',
        ptogglemode = 'zp',
        ptoggleitem = 'p',
        ptoggleauto = 'P',
        pscrollup = '<C-b>',
        pscrolldown = '<C-f>',
        pscrollorig = 'zo',
        prevfile = '<C-p>',
        nextfile = '<C-n>',
        prevhist = '<',
        nexthist = '>',
        lastleave = [['"]],
        stoggleup = '<S-Tab>',
        stoggledown = '<Tab>',
        stogglevm = '<Tab>',
        stogglebuf = [['<Tab>]],
        sclear = 'z<Tab>',
        filter = 'zn',
        filterr = 'zN',
        fzffilter = 'zf'
    },
}

local dressing_opt = {
    input = {
        insert_only = false,
        start_in_insert = true,
    }
}

local lualine_opts = {
    sections = {
        lualine_c = {
            {
                'filename',
                file_status = true,
                path = 2,
                short_target = 40,
                symbols = {
                    modified = '[+]',
                    readonly = '[-]',
                    unnamed = '[No Name]',
                }
            },
        },
    },
};

return {
    ---------------------- Color schema ----------------------
    {
        "ellisonleao/gruvbox.nvim",
        enabled = true,
        lazy = false,
        priority = 1000,
        config = true
    },
    {
        "fengys1996/nightfox.nvim",
        -- dir = "/home/fys/projects/nightfox.nvim",
        enabled = true,
        lazy = false,
        priority = 1000,
        config = true
    },
    {
        "rebelot/kanagawa.nvim",
        enabled = true,
        lazy = false,
        priority = 1000,
        config = true
    },
    {
        "neanias/everforest-nvim",
        lazy = false,
        priority = 1000,
        config = everforest
    },
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
    },
    ---------------------- Others ----------------------
    {
        "j-hui/fidget.nvim",
        tag = "v1.6.1",
        opts = {},
    },
    {
        "stevearc/dressing.nvim",
        enabled = true,
        opts = dressing_opt,
    },
    {
        "lewis6991/satellite.nvim",
        enabled = false,
        config = true,
    },
    {
        "kevinhwang91/nvim-bqf",
        enabled = false,
        ft = "qf",
        config = function()
            require("bqf").setup(bqf_opts);
        end
    },
    ---------------------- lualine ----------------------
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        opts = lualine_opts,
    }
}
