local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
    return
end

local status_ok_install, install = pcall(require, "nvim-treesitter.install")
if not status_ok_install then
    return
end

install.prefer_git = true

local status_ok_hlargs, _ = pcall(require, "hlargs")
if not status_ok_hlargs then
    return
end

local status_ok_rainbow, rainbow_delimiters = pcall(require, "rainbow-delimiters")
if not status_ok_rainbow then
    return
end

configs.setup({
    ensure_installed = "all", -- one of "all" or a list of languages
    sync_install = false, -- install languages asynchronously
    auto_install = true, -- installs missing parsers on opening file
    ignore_install = {
        "smali",
        "fusion",
        "blueprint",
        "t32",
        "jsonc",
        "ruby",
        "tlaplus",
    }, -- list of languages to ignore installing
    highlight = {
        enable = true, -- false disables whole extension
        disable = { "" }, -- list of languages to be disabled for highlight
        additional_vim_regex_highlighting = false,
    },
    indent = { enable = true, disable = { "yaml" } },
    context_commentstring = {
        enable = true,
        enable_autocmd = false,
    },
})

-- Not using setup() call because of additional overhead according to the documentation.
vim.g.rainbow_delimiters = {
    strategy = {
        [""] = rainbow_delimiters.strategy["global"],
        vim = rainbow_delimiters.strategy["local"],
    },
    query = {
        [""] = "rainbow-delimiters",
        lua = "rainbow-blocks",
    },
    -- blacklist = { "c", "cpp" }, -- add blacklisted languages here
}
