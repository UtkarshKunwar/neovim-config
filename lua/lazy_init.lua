-----------------------------------------------------------
-- Plugin manager configuration file
-----------------------------------------------------------

-- Plugin manager: packer.nvim
-- url: https://github.com/wbthomason/packer.nvim

-- For information about installed plugins see the README:
-- neovim-lua/README.md
-- https://github.com/brainfucksec/neovim-lua#readme

-- Automatically install packer
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

-- Remap backslash as leader key
vim.g.mapleader = "\\"
vim.g.maplocalleader = "\\"

-- Autocommand that reloads neovim whenever you save the packer_init.lua file
-- vim.cmd([[
--   augroup packer_user_config
--     autocmd!
--     autocmd BufWritePost packer_init.lua source <afile> | PackerSync
--   augroup end
-- ]])

-- Use a protected call so we don't error out on first use
local status_ok, lazy = pcall(require, "lazy")
if not status_ok then
    return
end

-- Install plugins
lazy.setup({
    -- Add you plugins here:
    { "nvim-lua/popup.nvim", commit = "b7404d35d5d3548a82149238289fa71f7f6de4ac" }, -- An implementation of the Popup API from vim in Neovim
    { "nvim-lua/plenary.nvim", commit = "9ce85b0f7dcfe5358c0be937ad23e456907d410b" }, -- Useful lua functions used ny lots of plugins
    { "andymass/vim-matchup", event = "VimEnter", commit = "6dbe108230c7dbbf00555b7d4d9f6a891837ef07" }, -- Extend % support for matching keywords
    { "flazz/vim-colorschemes", commit = "fd8f122cef604330c96a6a6e434682dbdfb878c9" }, -- All the colorschemes
    { "Mofiqul/vscode.nvim", commit = "11b212096a0b2056fc8acaf31c0d62d656b6fd2d" }, -- Look like VSCode for the normies
    { "catppuccin/nvim", name = "catppuccin", commit = "4fbab1f01488718c3d54034a473d0346346b90e3" },

    -- cmp plugins
    { "hrsh7th/nvim-cmp", commit = "5dce1b778b85c717f6614e3f4da45e9f19f54435" }, -- The completion plugin
    { "hrsh7th/cmp-buffer", commit = "3022dbc9166796b644a841a02de8dd1cc1d311fa" }, -- buffer completions
    { "hrsh7th/cmp-path", commit = "91ff86cd9c29299a64f968ebb45846c485725f23" }, -- path completions
    { "hrsh7th/cmp-cmdline", commit = "8ee981b4a91f536f52add291594e89fb6645e451" }, -- cmdline completions
    { "hrsh7th/cmp-calc", commit = "ce91d14d2e7a8b3f6ad86d85e34d41c1ae6268d9" }, -- cmdline completions
    { "saadparwaiz1/cmp_luasnip", commit = "18095520391186d634a0045dacaa346291096566" }, -- snippet completions
    { "hrsh7th/cmp-nvim-lua", commit = "f12408bdb54c39c23e67cab726264c10db33ada8" }, -- completion for lua
    {
        "petertriho/cmp-git",
        dependencies = "nvim-lua/plenary.nvim",
        commit = "8d8993680d627c8f13bd85094eba84604107dbdd",
    },
    {
        "UtkarshKunwar/cmp-emoji",
        commit = "dbe10a6114e2ac5dfc164bbc8e8d34c70a2deefc",
    },

    -- snippets
    { "L3MON4D3/LuaSnip", commit = "82108e7e31cc6fc223cc5df5cae6d89f70bb199f", build = "make install_jsregexp" }, --snippet engine
    { "rafamadriz/friendly-snippets", commit = "ebf6d6e83494cdd88a54a429340256f4dbb6a052" }, -- a bunch of snippets to use

    -- LSP
    { "neovim/nvim-lspconfig", commit = "4266f9bb36b4fb09edd19b67d95043cf7ff88ddf" }, -- enables LSP
    { "williamboman/mason.nvim", version = "v1.8.0" }, -- simple installation of LSPs
    { "williamboman/mason-lspconfig.nvim", commit = "2451adb9bdb0fd32140bf3aa8dbc17ff60050db3" }, -- simple installation of LSPs
    { "WhoIsSethDaniel/mason-tool-installer.nvim", commit = "031903fefbf59371502092ef9e22cab9161d90ba" }, -- Automatically install mason stuff
    { "hrsh7th/cmp-nvim-lsp", commit = "44b16d11215dce86f253ce0c30949813c0a90765" }, -- completion for nvim LSP
    { "nvimtools/none-ls.nvim", commit = "e64f03f3f77bd6854c3b3c5cfffcc806a0c0f66a" }, -- for formatters and linters
    { "jay-babu/mason-null-ls.nvim", version = "v2.3.0" }, -- to close the gaps between null-ls and mason
    { "RRethy/vim-illuminate", commit = "6acf7d4a18255a3ddc43770866c8e148fe85af7b" }, -- for hover usage highlighting
    { "ray-x/lsp_signature.nvim", commit = "bdf3dc7bb03edd25c2173e0e31c2fb122052ed23" }, -- for improved signatures

    -- Fuzzy file finder
    { "nvim-telescope/telescope.nvim", commit = "40c8d2fc2b729dd442eda093cf8c9496d6e23732" },
    { "nvim-telescope/telescope-media-files.nvim", commit = "0826c7a730bc4d36068f7c85cf4c5b3fd9fb570a" },

    -- Motion
    {
        "phaazon/hop.nvim",
        version = "v2.0.3", -- optional but strongly recommended
    },
    { "karb94/neoscroll.nvim", commit = "4bc0212e9f2a7bc7fe7a6bceb15b33e39f0f41fb" },

    -- TreeSitter
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
    },
    { "hiphish/rainbow-delimiters.nvim", commit = "9cbd3dc409af1f5531778ccd1ea6bce668241f39" },
    {
        "m-demare/hlargs.nvim",
        dependencies = { "nvim-treesitter/nvim-treesitter" },
        commit = "6218a401824c5733ac50b264991b62d064e85ab2",
    },

    -- Markdown previewer
    {
        "iamcco/markdown-preview.nvim",
        build = function()
            vim.fn["mkdp#util#install"]()
        end,
        commit = "02cc3874738bc0f86e4b91f09b8a0ac88aef8e96",
    },

    -- Brackets
    { "windwp/nvim-autopairs", commit = "7b3eb9b5813a22188c4dbb248475fcbaf9f4d195" }, -- Automatically close brackets
    { "kylechui/nvim-surround", commit = "1c2ef599abeeb98e40706830bcd27e90e259367a" }, -- Conveniently change brackets

    -- Commenting
    { "numToStr/Comment.nvim", commit = "0236521ea582747b58869cb72f70ccfa967d2e89" }, -- allows commenting
    { "JoosepAlviste/nvim-ts-context-commentstring", commit = "95e9ba9de4289d221666b66fd930d157c7ca08c6" }, -- Uses treesitter to get context for better commenting

    -- Git
    { "lewis6991/gitsigns.nvim", commit = "bce4576a9047085a528c479a7fe1e2f6b787b6c1" },
    { "f-person/git-blame.nvim", commit = "f07e913b7143f19edd6787229f2d51759b478600" },

    -- File Tree Plugin
    { "nvim-tree/nvim-tree.lua", commit = "a3aa3b47eac8b6289f028743bef4ce9eb0f6782e" },

    -- Icons
    { "nvim-tree/nvim-web-devicons", commit = "973ab742f143a796a779af4d786ec409116a0d87" },

    -- BufferLine
    { "akinsho/bufferline.nvim", version = "v4.4.0" },
    { "tiagovla/scope.nvim", commit = "cd27af77ad61a7199af5c28d27013fb956eb0e3e" },
    { "ojroques/nvim-bufdel", commit = "96c4f7ab053ddab0025bebe5f7c71e4795430e47" },
    { "SmiteshP/nvim-navic", commit = "0ffa7ffe6588f3417e680439872f5049e38a24db" },

    -- LuaLine
    { "nvim-lualine/lualine.nvim", commit = "45e27ca739c7be6c49e5496d14fcf45a303c3a63" },

    -- Symbols outline
    { "stevearc/aerial.nvim", commit = "8ccc18055ba855affec5c251e615b92595ac2dba" },

    -- ToggleTerm
    { "akinsho/toggleterm.nvim", version = "v2.7.1" },

    -- Projects
    { "ahmedkhalf/project.nvim", commit = "8c6bad7d22eef1b71144b401c9f74ed01526a4fb" },

    -- Impatient for faster startups
    { "lewis6991/impatient.nvim", commit = "47302af74be7b79f002773011f0d8e85679a7618" },

    -- IndentLine
    { "lukas-reineke/indent-blankline.nvim", main="ibl", version = "v3.5.2" },

    -- Welcome screen
    { "goolord/alpha-nvim", commit = "234822140b265ec4ba3203e3e0be0e0bb826dff5" },

    -- Which key to press for doing what
    { "folke/which-key.nvim", commit = "7ccf476ebe0445a741b64e36c78a682c1c6118b7" },

    -- Document generator
    {
        "kkoomen/vim-doge",
        build = ':call doge#install({ "headless": 1 })',
        commit = "aa449a31373526fe12e72dde4532c1d7abf6787a",
    },

    -- Nice looking pop-ups
    { "stevearc/dressing.nvim", commit = "c1e1d5fa44fe08811b6ef4aadac2b50e602f9504" },

    -- Notifications
    { "rcarriga/nvim-notify", commit = "94859430020f5cf32a1b97ddd9e596fed9db7981" },

    -- Debugger
    { "mfussenegger/nvim-dap", commit = "b3d4408e29d924fe130c9397a7c3b3630b3ea671" },
    {
        "rcarriga/nvim-dap-ui",
        dependencies = { "mfussenegger/nvim-dap" },
        version = "v3.9.1",
    },
    { "mfussenegger/nvim-dap-python", commit = "37b4cba02e337a95cb62ad1609b3d1dccb2e5d42" },
    { "theHamsta/nvim-dap-virtual-text", commit = "57f1dbd0458dd84a286b27768c142e1567f3ce3b" },
    { "nvim-telescope/telescope-dap.nvim", commit = "4e2d5efb92062f0b865fe59b200b5ed7793833bf" },

    -- All 'bout dat colour code vizz
    { "norcalli/nvim-colorizer.lua", commit = "36c610a9717cc9ec426a07c8e6bf3b3abcb139d6" },

    -- Scrollbar
    {
        "petertriho/nvim-scrollbar",
        dependencies = { "kevinhwang91/nvim-hlslens" },
        commit = "35f99d559041c7c0eff3a41f9093581ceea534e8",
    },

    -- Virtual environment
    { "linux-cultist/venv-selector.nvim", commit = "79709f8ad99ac2082d99a713985f3da0c924f4a2" },

    -- LLM
    { "David-Kunz/gen.nvim", commit = "41ad952c8269fa7aa3a4b8a5abb44541cb628313" },

    -- Zen Mode
    { "folke/zen-mode.nvim", commit = "50e2e2a36cc97847d9ab3b1a3555ba2ef6839b50" },
    { "folke/twilight.nvim", commit = "8b7b50c0cb2dc781b2f4262a5ddd57571556d1e4" },
})
