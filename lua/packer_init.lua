-----------------------------------------------------------
-- Plugin manager configuration file
-----------------------------------------------------------

-- Plugin manager: packer.nvim
-- url: https://github.com/wbthomason/packer.nvim

-- For information about installed plugins see the README:
-- neovim-lua/README.md
-- https://github.com/brainfucksec/neovim-lua#readme

-- Automatically install packer
local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

local packer_bootstrap

if fn.empty(fn.glob(install_path)) > 0 then
    packer_bootstrap = fn.system({
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
    })
    vim.o.runtimepath = vim.fn.stdpath("data") .. "/site/pack/*/start/*," .. vim.o.runtimepath
end

-- Autocommand that reloads neovim whenever you save the packer_init.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost packer_init.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
    return
end

-- Have packer use a popup window
packer.init({
    display = {
        open_fn = function()
            return require("packer.util").float({ border = "rounded" })
        end,
    },
})

-- Install plugins
return packer.startup(function(use)
    -- Add you plugins here:
    use("wbthomason/packer.nvim") -- packer can manage itself
    use({ "nvim-lua/popup.nvim", commit = "b7404d35d5d3548a82149238289fa71f7f6de4ac" }) -- An implementation of the Popup API from vim in Neovim
    use({ "nvim-lua/plenary.nvim", commit = "9ce85b0f7dcfe5358c0be937ad23e456907d410b" }) -- Useful lua functions used ny lots of plugins
    use({ "andymass/vim-matchup", event = "VimEnter", commit = "6dbe108230c7dbbf00555b7d4d9f6a891837ef07" }) -- Extend % support for matching keywords
    use({ "flazz/vim-colorschemes", commit = "fd8f122cef604330c96a6a6e434682dbdfb878c9" }) -- All the colorschemes
    use({ "Mofiqul/vscode.nvim", commit = "11b212096a0b2056fc8acaf31c0d62d656b6fd2d" }) -- Look like VSCode for the normies
    use({ "catppuccin/nvim", as = "catppuccin", commit = "4fbab1f01488718c3d54034a473d0346346b90e3" })

    -- cmp plugins
    use({ "hrsh7th/nvim-cmp", commit = "5dce1b778b85c717f6614e3f4da45e9f19f54435" }) -- The completion plugin
    use({ "hrsh7th/cmp-buffer", commit = "3022dbc9166796b644a841a02de8dd1cc1d311fa" }) -- buffer completions
    use({ "hrsh7th/cmp-path", commit = "91ff86cd9c29299a64f968ebb45846c485725f23" }) -- path completions
    use({ "hrsh7th/cmp-cmdline", commit = "8ee981b4a91f536f52add291594e89fb6645e451" }) -- cmdline completions
    use({ "hrsh7th/cmp-calc", commit = "ce91d14d2e7a8b3f6ad86d85e34d41c1ae6268d9" }) -- cmdline completions
    use({ "saadparwaiz1/cmp_luasnip", commit = "18095520391186d634a0045dacaa346291096566" }) -- snippet completions
    use({ "hrsh7th/cmp-nvim-lua", commit = "f12408bdb54c39c23e67cab726264c10db33ada8" }) -- completion for lua

    -- snippets
    use({ "L3MON4D3/LuaSnip", commit = "82108e7e31cc6fc223cc5df5cae6d89f70bb199f", run = "make install_jsregexp" }) --snippet engine
    use({ "rafamadriz/friendly-snippets", commit = "ebf6d6e83494cdd88a54a429340256f4dbb6a052" }) -- a bunch of snippets to use

    -- LSP
    use({ "neovim/nvim-lspconfig", commit = "4266f9bb36b4fb09edd19b67d95043cf7ff88ddf" }) -- enables LSP
    use({ "williamboman/mason.nvim", tag = "v1.8.0" }) -- simple installation of LSPs
    use({ "williamboman/mason-lspconfig.nvim", commit = "2451adb9bdb0fd32140bf3aa8dbc17ff60050db3" }) -- simple installation of LSPs
    use({ "WhoIsSethDaniel/mason-tool-installer.nvim", commit = "031903fefbf59371502092ef9e22cab9161d90ba" }) -- Automatically install mason stuff
    use({ "hrsh7th/cmp-nvim-lsp", commit = "44b16d11215dce86f253ce0c30949813c0a90765" }) -- completion for nvim LSP
    use({ "jose-elias-alvarez/null-ls.nvim", commit = "0010ea927ab7c09ef0ce9bf28c2b573fc302f5a7" }) -- for formatters and linters
    use({ "jay-babu/mason-null-ls.nvim", tag = "v2.1.0" }) -- to close the gaps between null-ls and mason
    use({ "RRethy/vim-illuminate", commit = "6acf7d4a18255a3ddc43770866c8e148fe85af7b" }) -- for hover usage highlighting
    use({ "ray-x/lsp_signature.nvim", commit = "bdf3dc7bb03edd25c2173e0e31c2fb122052ed23" }) -- for improved signatures

    -- Fuzzy file finder
    use({ "nvim-telescope/telescope.nvim", commit = "40c8d2fc2b729dd442eda093cf8c9496d6e23732" })
    use({ "nvim-telescope/telescope-media-files.nvim", commit = "0826c7a730bc4d36068f7c85cf4c5b3fd9fb570a" })

    -- Motion
    use({
        "phaazon/hop.nvim",
        tag = "v2.0.3", -- optional but strongly recommended
    })
    use({ "karb94/neoscroll.nvim", commit = "4bc0212e9f2a7bc7fe7a6bceb15b33e39f0f41fb" })

    -- TreeSitter
    use({
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
        commit = "b7f2dd5dfbd24a1239844e15637b637b990df164",
    })
    use({ "hiphish/rainbow-delimiters.nvim", commit = "9cbd3dc409af1f5531778ccd1ea6bce668241f39" })
    use({
        "m-demare/hlargs.nvim",
        requires = { "nvim-treesitter/nvim-treesitter" },
        commit = "6218a401824c5733ac50b264991b62d064e85ab2",
    })

    -- Markdown previewer
    use({
        "iamcco/markdown-preview.nvim",
        run = function()
            vim.fn["mkdp#util#install"]()
        end,
        commit = "02cc3874738bc0f86e4b91f09b8a0ac88aef8e96",
    })

    -- Brackets
    use({ "windwp/nvim-autopairs", commit = "7b3eb9b5813a22188c4dbb248475fcbaf9f4d195" }) -- Automatically close brackets
    use({ "kylechui/nvim-surround", commit = "1c2ef599abeeb98e40706830bcd27e90e259367a" }) -- Conveniently change brackets

    -- Commenting
    use({ "numToStr/Comment.nvim", commit = "0236521ea582747b58869cb72f70ccfa967d2e89" }) -- allows commenting
    use({ "JoosepAlviste/nvim-ts-context-commentstring", commit = "95e9ba9de4289d221666b66fd930d157c7ca08c6" }) -- Uses treesitter to get context for better commenting

    -- Git
    use({ "lewis6991/gitsigns.nvim", commit = "bce4576a9047085a528c479a7fe1e2f6b787b6c1" })
    use({ "f-person/git-blame.nvim", commit = "f07e913b7143f19edd6787229f2d51759b478600" })

    -- File Tree Plugin
    use({ "nvim-tree/nvim-tree.lua", commit = "a3aa3b47eac8b6289f028743bef4ce9eb0f6782e" })

    -- Icons
    use({ "nvim-tree/nvim-web-devicons", commit = "973ab742f143a796a779af4d786ec409116a0d87" })

    -- BufferLine
    use({ "akinsho/bufferline.nvim", tag = "v4.4.0" })
    use({ "tiagovla/scope.nvim", commit = "cd27af77ad61a7199af5c28d27013fb956eb0e3e" })
    use({ "ojroques/nvim-bufdel", commit = "96c4f7ab053ddab0025bebe5f7c71e4795430e47" })
    use({ "SmiteshP/nvim-navic", commit = "0ffa7ffe6588f3417e680439872f5049e38a24db" })

    -- LuaLine
    use({ "nvim-lualine/lualine.nvim", commit = "45e27ca739c7be6c49e5496d14fcf45a303c3a63" })

    -- Symbols outline
    use({ "stevearc/aerial.nvim", commit = "a2368d1c4bdb149679fbcbd16a288e5e0bee8156" })

    -- ToggleTerm
    use({ "akinsho/toggleterm.nvim", tag = "v2.7.1" })

    -- Projects
    use({ "ahmedkhalf/project.nvim", commit = "8c6bad7d22eef1b71144b401c9f74ed01526a4fb" })

    -- Impatient for faster startups
    use({ "lewis6991/impatient.nvim", commit = "47302af74be7b79f002773011f0d8e85679a7618" })

    -- IndentLine
    use({ "lukas-reineke/indent-blankline.nvim", tag = "v2.20.8" })

    -- Welcome screen
    use({ "goolord/alpha-nvim", commit = "234822140b265ec4ba3203e3e0be0e0bb826dff5" })

    -- Which key to press for doing what
    use({ "folke/which-key.nvim", commit = "7ccf476ebe0445a741b64e36c78a682c1c6118b7" })

    -- Document generator
    use({
        "kkoomen/vim-doge",
        run = ':call doge#install({ "headless": 1 })',
        commit = "aa449a31373526fe12e72dde4532c1d7abf6787a",
    })

    -- Nice looking pop-ups
    use({ "stevearc/dressing.nvim", commit = "c1e1d5fa44fe08811b6ef4aadac2b50e602f9504" })

    -- Notifications
    use({ "rcarriga/nvim-notify", commit = "94859430020f5cf32a1b97ddd9e596fed9db7981" })

    -- Debugger
    use({ "mfussenegger/nvim-dap", commit = "b3d4408e29d924fe130c9397a7c3b3630b3ea671" })
    use({
        "rcarriga/nvim-dap-ui",
        requires = { "mfussenegger/nvim-dap" },
        tag = "v3.9.1",
    })
    use({ "mfussenegger/nvim-dap-python", commit = "37b4cba02e337a95cb62ad1609b3d1dccb2e5d42" })
    use({ "theHamsta/nvim-dap-virtual-text", commit = "57f1dbd0458dd84a286b27768c142e1567f3ce3b" })
    use({ "nvim-telescope/telescope-dap.nvim", commit = "4e2d5efb92062f0b865fe59b200b5ed7793833bf" })

    -- All 'bout dat colour code vizz
    use({ "norcalli/nvim-colorizer.lua", commit = "36c610a9717cc9ec426a07c8e6bf3b3abcb139d6" })

    -- Scrollbar
    use({
        "petertriho/nvim-scrollbar",
        requires = { "kevinhwang91/nvim-hlslens" },
        commit = "35f99d559041c7c0eff3a41f9093581ceea534e8",
    })

    -- Virtual environment
    use({ "linux-cultist/venv-selector.nvim", commit = "79709f8ad99ac2082d99a713985f3da0c924f4a2" })

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
        require("packer").sync()
    end
end)
