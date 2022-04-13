local packer = require("packer")
packer.startup(
  function(use)
    -- Packer can mangage themselves
    use 'wbthomason/packer.nvim'
    -- tokyonight
    use("folke/tokyonight.nvim")
    -- nvim-tree
    use({ "kyazdani42/nvim-tree.lua", requires = "kyazdani42/nvim-web-devicons" })
    -- buffer line
    use({ "akinsho/bufferline.nvim", requires = { "kyazdani42/nvim-web-devicons", "moll/vim-bbye" }})
    -- lualine
    use({ "nvim-lualine/lualine.nvim", requires = { "kyazdani42/nvim-web-devicons" } })
    use("arkav/lualine-lsp-progress")
    -- telescope
    use { 'nvim-telescope/telescope.nvim', requires = { "nvim-lua/plenary.nvim" } }
    -- dashboard-nvim
    use("glepnir/dashboard-nvim")
    -- project
    use("ahmedkhalf/project.nvim")
    -- treesitter
    use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })

    --------------------- LSP --------------------
    -- lspconfig
    -- use("neovim/nvim-lspconfig")
    use({"neovim/nvim-lspconfig", "williamboman/nvim-lsp-installer"})
    -- completion engine
    use("hrsh7th/nvim-cmp")
    -- snippet engine
    use("hrsh7th/vim-vsnip")
    -- complete source
    use("hrsh7th/cmp-vsnip")
    use("hrsh7th/cmp-nvim-lsp")
    use("hrsh7th/cmp-buffer")
    use("hrsh7th/cmp-path")
    use("hrsh7th/cmp-cmdline")
    -- common programming language code snippets
    use("rafamadriz/friendly-snippets")
    -- -- ui
    use("onsails/lspkind-nvim")
    use("tami5/lspsaga.nvim" )
    use("simrat39/rust-tools.nvim")
    use("nvim-lua/plenary.nvim")
    use("mfussenegger/nvim-dap")
    use('nvim-telescope/telescope-ui-select.nvim')
    use('mhinz/vim-signify')
    use('tpope/vim-fugitive')
    use('tpope/vim-rhubarb')
    use('junegunn/gv.vim')
    use("lukas-reineke/indent-blankline.nvim")
    -- comment
    use('numToStr/Comment.nvim')
  end)

------ Plugins are automatically installed every time you save this file ------
pcall(
  vim.cmd,
  [[
    augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
    augroup end
  ]]
)
