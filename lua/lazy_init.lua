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
    "nvim-lua/popup.nvim", -- An implementation of the Popup API from vim in Neovim
    "nvim-lua/plenary.nvim", -- Useful lua functions used ny lots of plugins
    { "andymass/vim-matchup", event = "VimEnter" }, -- Extend % support for matching keywords
    "flazz/vim-colorschemes", -- All the colorschemes
    "Mofiqul/vscode.nvim", -- Look like VSCode for the normies
    { "catppuccin/nvim", name = "catppuccin", priority = 1000 },

    -- cmp plugins
    "hrsh7th/nvim-cmp", -- The completion plugin
    "hrsh7th/cmp-buffer", -- buffer completions
    "hrsh7th/cmp-path", -- path completions
    "hrsh7th/cmp-cmdline", -- cmdline completions
    "hrsh7th/cmp-calc", -- cmdline completions
    "saadparwaiz1/cmp_luasnip", -- snippet completions
    "hrsh7th/cmp-nvim-lua", -- completion for lua
    {
        "petertriho/cmp-git",
        dependencies = "nvim-lua/plenary.nvim",
    },

    "UtkarshKunwar/cmp-emoji",

    -- snippets
    "L3MON4D3/LuaSnip", --snippet engine
    "rafamadriz/friendly-snippets", -- a bunch of snippets to use

    -- LSP
    "neovim/nvim-lspconfig", -- enables LSP
    "williamboman/mason.nvim", -- simple installation of LSPs
    "williamboman/mason-lspconfig.nvim", -- simple installation of LSPs
    "WhoIsSethDaniel/mason-tool-installer.nvim", -- Automatically install mason stuff
    "hrsh7th/cmp-nvim-lsp", -- completion for nvim LSP
    {
        "nvimtools/none-ls.nvim", -- for formatters and linters
        dependencies = {
            "nvimtools/none-ls-extras.nvim",
            "gbprod/none-ls-shellcheck.nvim",
        },
    },
    {
        "jay-babu/mason-null-ls.nvim",
        event = { "BufReadPre", "BufNewFile" },
    }, -- to close the gaps between null-ls and mason
    "RRethy/vim-illuminate", -- for hover usage highlighting
    { "ray-x/lsp_signature.nvim", event = "VeryLazy" }, -- for improved signatures

    -- Fuzzy file finder
    "nvim-telescope/telescope.nvim",
    "nvim-telescope/telescope-media-files.nvim",

    -- Motion
    {
        "phaazon/hop.nvim",
        branch = "v2", -- optional but strongly recommended
    },
    "karb94/neoscroll.nvim",

    -- TreeSitter
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
    },
    { "hiphish/rainbow-delimiters.nvim", submodules = false },
    {
        "m-demare/hlargs.nvim",
        dependencies = { "nvim-treesitter/nvim-treesitter" },
    },

    -- Markdown previewer
    {
        "UtkarshKunwar/markdown-preview.nvim",
        build = function(plugin)
            if vim.fn.executable("npx") then
                vim.cmd(
                    "!cd "
                        .. plugin.dir
                        .. " && cd app && npx --yes yarn install"
                )
            else
                vim.cmd([[Lazy load markdown-preview.nvim]])
                vim.fn["mkdp#util#install"]()
            end
        end,
    },

    -- Brackets
    { "windwp/nvim-autopairs", event = "InsertEnter" }, -- Automatically close brackets
    { "kylechui/nvim-surround", event = "VeryLazy" }, -- Conveniently change brackets

    -- Commenting
    { "numToStr/Comment.nvim", lazy = false }, -- allows commenting
    "JoosepAlviste/nvim-ts-context-commentstring", -- Uses treesitter to get context for better commenting
    {
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
    },

    -- Git
    "lewis6991/gitsigns.nvim",
    "f-person/git-blame.nvim",

    -- File Tree Plugin
    { "nvim-tree/nvim-tree.lua", lazy = false },

    -- Icons
    "nvim-tree/nvim-web-devicons",

    -- BufferLine
    { "akinsho/bufferline.nvim", version = "*" },
    "tiagovla/scope.nvim",
    "ojroques/nvim-bufdel",
    "SmiteshP/nvim-navic",

    -- LuaLine
    "nvim-lualine/lualine.nvim",

    -- Symbols outline
    "stevearc/aerial.nvim",

    -- ToggleTerm
    { "akinsho/toggleterm.nvim", version = "*" },

    -- Projects
    "ahmedkhalf/project.nvim",

    -- Impatient for faster startups
    "lewis6991/impatient.nvim",

    -- IndentLine
    { "lukas-reineke/indent-blankline.nvim", main = "ibl" },

    -- Welcome screen
    {
        "goolord/alpha-nvim",
        dependencies = { "BlakeJC94/alpha-nvim-fortune" },
    },

    -- Which key to press for doing what
    -- TODO: Update to v3. Requires porting the config entirely.
    {
        "folke/which-key.nvim",
        tag = "v2.1.0",
        event = "VeryLazy",
        dependencies = { "echasnovski/mini.icons" },
    },

    -- Document generator
    {
        "kkoomen/vim-doge",
        build = ':call doge#install({ "headless": 1 })',
    },

    -- Nice looking pop-ups
    "stevearc/dressing.nvim",

    -- Notifications
    "rcarriga/nvim-notify",

    -- Debugger
    "mfussenegger/nvim-dap",
    {
        "rcarriga/nvim-dap-ui",
        dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
    },
    "mfussenegger/nvim-dap-python",
    "theHamsta/nvim-dap-virtual-text",
    "nvim-telescope/telescope-dap.nvim",

    -- All 'bout dat colour code vizz
    "norcalli/nvim-colorizer.lua",

    -- Scrollbar
    {
        "petertriho/nvim-scrollbar",
        dependencies = { "kevinhwang91/nvim-hlslens" },
    },

    -- Virtual environment
    -- TODO: Update to the regexp branch
    {
        "linux-cultist/venv-selector.nvim",
        branch = "main",
        event = "VeryLazy",
    },

    -- LLM
    { "David-Kunz/gen.nvim", event = "VeryLazy" },

    -- Zen Mode
    "folke/zen-mode.nvim",
    "folke/twilight.nvim",

    -- Easy substitute for mixed cases
    {
        "johmsalas/text-case.nvim",
        dependencies = { "nvim-telescope/telescope.nvim" },
        lazy = false,
    },

    -- Open large files successfully
    {
        "mireq/large_file",
        config = function()
            require("large_file").setup({
                size_limit = 512 * 1024, -- 512kiB
                on_large_file_read_pre = function(_)
                    vim.notify("Opening a large file!", vim.log.levels.WARN)
                end,
            })
        end,
    },
})
