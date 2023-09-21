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
    use("nvim-lua/popup.nvim") -- An implementation of the Popup API from vim in Neovim
    use("nvim-lua/plenary.nvim") -- Useful lua functions used ny lots of plugins
    use({ "andymass/vim-matchup", event = "VimEnter" }) -- Extend % support for matching keywords
    use("flazz/vim-colorschemes") -- All the colorschemes
    use("Mofiqul/vscode.nvim") -- Look like VSCode for the normies

    -- cmp plugins
    use("hrsh7th/nvim-cmp") -- The completion plugin
    use("hrsh7th/cmp-buffer") -- buffer completions
    use("hrsh7th/cmp-path") -- path completions
    use("hrsh7th/cmp-cmdline") -- cmdline completions
    use("saadparwaiz1/cmp_luasnip") -- snippet completions
    use("hrsh7th/cmp-nvim-lua") -- completion for lua

    -- snippets
    use("L3MON4D3/LuaSnip") --snippet engine
    use("rafamadriz/friendly-snippets") -- a bunch of snippets to use

    -- LSP
    use("neovim/nvim-lspconfig") -- enables LSP
    use("williamboman/mason.nvim") -- simple installation of LSPs
    use("williamboman/mason-lspconfig.nvim") -- simple installation of LSPs
    use("WhoIsSethDaniel/mason-tool-installer.nvim") -- Automatically install mason stuff
    use("hrsh7th/cmp-nvim-lsp") -- completion for nvim LSP
    use("jose-elias-alvarez/null-ls.nvim") -- for formatters and linters
    use("jay-babu/mason-null-ls.nvim") -- to close the gaps between null-ls and mason
    use("RRethy/vim-illuminate") -- for hover usage highlighting
    use("ray-x/lsp_signature.nvim") -- for improved signatures

    -- Fuzzy file finder
    use("nvim-telescope/telescope.nvim")
    use("nvim-telescope/telescope-media-files.nvim")

    -- Motion
    use({
        "phaazon/hop.nvim",
        branch = "v2", -- optional but strongly recommended
    })
    use("karb94/neoscroll.nvim")

    -- TreeSitter
    use({
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
    })
    use("hiphish/rainbow-delimiters.nvim")
    use({
        "m-demare/hlargs.nvim",
        requires = { "nvim-treesitter/nvim-treesitter" },
    })

    -- Markdown previewer
    use({
        "iamcco/markdown-preview.nvim",
        run = function()
            vim.fn["mkdp#util#install"]()
        end,
    })

    -- Brackets
    use("windwp/nvim-autopairs") -- Automatically close brackets
    use("kylechui/nvim-surround") -- Conveniently change brackets

    -- Commenting
    use("numToStr/Comment.nvim") -- allows commenting
    use("JoosepAlviste/nvim-ts-context-commentstring") -- Uses treesitter to get context for better commenting

    -- Git
    use("lewis6991/gitsigns.nvim")
    use("f-person/git-blame.nvim")

    -- File Tree Plugin
    use("nvim-tree/nvim-tree.lua")

    -- Icons
    use("nvim-tree/nvim-web-devicons")

    -- BufferLine
    use("akinsho/bufferline.nvim")
    use("ojroques/nvim-bufdel")
    use("SmiteshP/nvim-navic")

    -- LuaLine
    use("nvim-lualine/lualine.nvim")

    -- Symbols outline
    use("stevearc/aerial.nvim")

    -- ToggleTerm
    use({ "akinsho/toggleterm.nvim", tag = "v2.7.1" })

    -- Projects
    use("ahmedkhalf/project.nvim")

    -- Impatient for faster startups
    use("lewis6991/impatient.nvim")

    -- IndentLine
    use("lukas-reineke/indent-blankline.nvim")

    -- Welcome screen
    use("goolord/alpha-nvim")

    -- Which key to press for doing what
    use("folke/which-key.nvim")

    -- Document generator
    use({
        "kkoomen/vim-doge",
        run = ':call doge#install({ "headless": 1 })',
    })

    -- Don't accidentally open stuff in other buffers
    use("stevearc/stickybuf.nvim")

    -- Nice looking pop-ups
    use("stevearc/dressing.nvim")

    -- Notifications
    use("rcarriga/nvim-notify")

    -- Debugger
    use({ "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } })
    use("mfussenegger/nvim-dap-python")
    use("theHamsta/nvim-dap-virtual-text")
    use("nvim-telescope/telescope-dap.nvim")

    -- All 'bout dat colour code vizz
    use("norcalli/nvim-colorizer.lua")

    -- Scrollbar
    use({ "petertriho/nvim-scrollbar", requires = { "kevinhwang91/nvim-hlslens" } })

    -- Confirm on quit.
    use({
        "yutkat/confirm-quit.nvim",
        event = "CmdlineEnter",
        config = function()
            require("confirm-quit").setup()
        end,
    })

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
        require("packer").sync()
    end
end)
