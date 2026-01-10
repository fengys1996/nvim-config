local illuminate = function()
    local status, illuminate = pcall(require, "illuminate")
    if not status then
        vim.notify("not found illuminate")
    end

    illuminate.configure({
        -- ordered by priority
        providers = {
            'lsp',
            'treesitter',
            'regex',
        },
        -- milliseconds
        delay = 100,
        filetype_overrides = {},
        filetypes_denylist = {
            'dirvish',
            'fugitive',
            'NvimTree',
            'qf',
            'Outline',
        },
        filetypes_allowlist = {},
        modes_denylist = {},
        modes_allowlist = {},
        providers_regex_syntax_denylist = {},
        providers_regex_syntax_allowlist = {},
        under_cursor = true,
        large_file_cutoff = 10000,
        large_file_overrides = nil,
        min_count_to_highlight = 2,
    })
end

local symbols = {
    outline_window = {
        position = "right",
        show_numbers = true,
        show_relative_numbers = true,
        width = 20,
    },
    symbol_folding = {
        autofold_depth = false,
        auto_unfold = {
            hovered = true,
            only = true,
        },
    },
}

local config_hop = function()
    local hop = require('hop')
    -- local directions = require('hop.hint').HintDirection

    hop.setup()

    vim.keymap.set('', 'f', function()
        hop.hint_char1({ current_line_only = true })
    end, { remap = true })

    vim.keymap.set('', 's', function()
        hop.hint_char2({})
    end, { remap = true })

    vim.keymap.set('', 'S', function()
        hop.hint_char2({ multi_windows = true })
    end, { remap = true })

    vim.keymap.set('', 't', function()
        hop.hint_char1({
            current_line_only = true,
            hint_offset = -1
        })
    end, { remap = true })
end

local config_mark = function()
    local opt = {
        default_mappings = true,
        mappings = {}
    };

    require 'marks'.setup(opt)
end

local ufo = function()
    vim.o.foldlevel = 99
    vim.o.foldlevelstart = 99
    vim.o.foldenable = true

    local status, ufo = pcall(require, "ufo")

    if not status then
        vim.notify("not found ufo")
        return
    end

    vim.keymap.set('n', 'zR', ufo.openAllFolds)
    vim.keymap.set('n', 'zM', ufo.closeAllFolds)
    vim.keymap.set('n', 'zr', ufo.openFoldsExceptKinds)
    vim.keymap.set('n', 'zm', ufo.closeFoldsWith)

    ufo.setup({
        provider_selector = function(_, _, _)
            return { 'treesitter', 'indent' }
        end
    })
end

local big_file = function()
    require("bigfile").setup {
        -- 1MB
        filesize = 1,
        pattern = { "*" },
        features = {
            "lsp",
            "treesitter",
        },
    }
end

return {
    {
        "smoka7/hop.nvim",
        tag = "v2.7.2",
        config = config_hop,
    },
    {
        "tpope/vim-surround",
        event = "VeryLazy",
        config = function()
        end,
    },
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = true,
    },
    {
        "TheBlob42/houdini.nvim",
        config = function()
            require('houdini').setup {
                mappings = { 'jk' },
            }
        end,
    },
    {
        -- highlighting other uses of the word under the cursor using
        -- either LSP, Tree-sitter, or regex matching.
        "RRethy/vim-illuminate",
        enabled = true,
        event = { "BufReadPost", "BufNewFile" },
        config = illuminate,
    },
    {
        "hedyhli/outline.nvim",
        enabled = true,
        lazy = true,
        keys = {
            { "<A-n>", "<cmd>Outline<cr>", mode = { "n", "i", "t" } },
        },
        opts = symbols,
    },
    ---------------------- fold ----------------------
    {
        "kevinhwang91/nvim-ufo",
        enabled = true,
        event = "BufEnter",
        dependencies = { "kevinhwang91/promise-async" },
        config = ufo,
    },
    {
        "LunarVim/bigfile.nvim",
        event = "BufEnter",
        config = big_file,
    }
}
