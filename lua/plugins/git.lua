local gitsigns_attach = function(bufnr)
    local gitsigns = require('gitsigns')

    local function map(mode, l, r, opts)
        opts = opts or {}
        opts.buffer = bufnr
        vim.keymap.set(mode, l, r, opts)
    end

    map('n', ']c', function()
        if vim.wo.diff then
            vim.cmd.normal({ ']c', bang = true })
        else
            gitsigns.nav_hunk('next', { target = "all" })
        end
    end)

    map('n', '[c', function()
        if vim.wo.diff then
            vim.cmd.normal({ '[c', bang = true })
        else
            gitsigns.nav_hunk('prev', { target = "all" })
        end
    end)

    map('n', 'gj', function()
        gitsigns.nav_hunk('next')
    end)

    map('n', 'gk', function()
        gitsigns.nav_hunk('prev')
    end)

    map('n', '<leader>hs', gitsigns.stage_hunk)
    map('v', '<leader>hs', function() gitsigns.stage_hunk { vim.fn.line('.'), vim.fn.line('v') } end)
    map('n', '<leader>hS', gitsigns.stage_buffer)

    map('n', '<leader>hr', gitsigns.reset_hunk)
    map('v', '<leader>hr', function() gitsigns.reset_hunk { vim.fn.line('.'), vim.fn.line('v') } end)
    map('n', '<leader>hR', gitsigns.reset_buffer)

    map('n', '<leader>hp', gitsigns.preview_hunk)

    map('n', '<leader>hd', gitsigns.diffthis)
    map('n', '<leader>hD', function() gitsigns.diffthis('~') end)

    map('n', '<leader>hq', gitsigns.setqflist)
    map('n', '<leader>hQ', function() gitsigns.setqflist('all') end)

    map('n', '<leader>ht', function() gitsigns.toggle_signs() end)
end

local gitsigns_opts = {
    sign_priority = 6,
    signcolumn = true,
    on_attach = gitsigns_attach,
}

local diffview = function()
    local actions = require("diffview.actions")
    require("diffview").setup({
        keymaps = {
            disable_defaults = false,
            file_panel = {
                { "n", "<A-m>", actions.toggle_files, { desc = "Toggle the file panel." } },
            },
            view = {
                { "n", "<A-m>", actions.toggle_files, { desc = "Toggle the file panel." } },
            },
        }
    })
end

return {
    {
        "lewis6991/gitsigns.nvim",
        enabled = true,
        tag = "v2.1.0",
        event = "VeryLazy",
        config = function()
            require('gitsigns').setup(gitsigns_opts)
        end,
    },
    {
        "tpope/vim-fugitive",
        tag = "v3.7",
        event = "VeryLazy",
        config = function()
        end,
    },
    {
        "junegunn/gv.vim",
        event = "VeryLazy",
        config = function()
        end,
    },
    {
        "sindrets/diffview.nvim",
        event = "VeryLazy",
        config = diffview,
    },
    {
        "tpope/vim-rhubarb",
        event = "VeryLazy",
        config = function()
        end,
    }
}
