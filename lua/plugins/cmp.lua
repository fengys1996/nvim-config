local config = function()
    local cmp = require "cmp"
    cmp.setup({
        -- Enable LSP snippets
        snippet = {
            expand = function(args)
                vim.fn["vsnip#anonymous"](args.body)
            end,
        },
        view = {
            entries = "custom" -- can be "custom", "wildmenu" or "native"
        },
        preselect = cmp.PreselectMode.None,
        mapping = cmp.mapping.preset.insert({
            ['<C-k>'] = cmp.mapping(cmp.mapping.select_prev_item(), { 'i', 'c' }),
            ['<C-j>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 'c' }),
            ['<C-u>'] = cmp.mapping.scroll_docs(-4),
            ['<C-d>'] = cmp.mapping.scroll_docs(4),
            ['<A-.>'] = cmp.mapping(cmp.mapping.complete({}), { 'i', 'c' }),
            ['<A-,>'] = cmp.mapping({
                i = cmp.mapping.abort(),
                c = cmp.mapping.close(),
            }),
            ['<CR>'] = cmp.mapping.confirm({
                -- behavior = cmp.ConfirmBehavior.Replace,
                behavior = cmp.ConfirmBehavior.Insert,
                select = true,
            })
        }),
        -- Installed sources:
        sources = cmp.config.sources({
            { name = 'path' },           -- file paths
            { name = 'nvim_lsp' },       -- from language server
            { name = 'nvim_lsp_signature_help' }, -- display function signatures with current parameter emphasized
            { name = 'nvim_lua' },       -- complete neovim's Lua runtime API such vim.lsp.*
            { name = 'buffer' },         -- source current buffer
            { name = 'vsnip' },          -- nvim-cmp source for vim-vsnip
            { name = 'calc' },           -- source for math calculation
        }),
        window = {
            -- completion = cmp.config.window.bordered(),
            -- documentation = cmp.config.window.bordered(),
        },
        -- Use default formatting
        -- formatting = {
        -- 	fields = { 'abbr', 'kind', 'menu' },
        -- 	format = function(entry, item)
        -- 		local menu_icon = {
        -- 			nvim_lsp = 'LSP',
        -- 			vsnip = 'VS',
        -- 			buffer = 'BUF',
        -- 			path = 'PATH',
        -- 		}
        -- 		item.menu = menu_icon[entry.source.name]
        -- 		return item
        -- 	end,
        -- },
    })

    -- Use buffer source for `/`.
    cmp.setup.cmdline('/', {
        sources = {
            { name = 'buffer' }
        },
    })

    -- Use cmdline & path source for ':'.
    cmp.setup.cmdline(':', {
        sources = cmp.config.sources({
            { name = 'path' }
        }, {
            { name = 'cmdline' }
        })
    })
end

return {
    "hrsh7th/nvim-cmp",
    enabled = false,
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-vsnip",
        "hrsh7th/cmp-nvim-lua",
        "hrsh7th/cmp-nvim-lsp-signature-help",
        "hrsh7th/vim-vsnip",
        "rafamadriz/friendly-snippets",
        "hrsh7th/cmp-calc",
    },
    config = config
}
