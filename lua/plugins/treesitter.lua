local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
    return
end

local status_ok_hlargs, _ = pcall(require, "hlargs")
if not status_ok_hlargs then
    return
end

configs.setup {
    ensure_installed = "all", -- one of "all" or a list of languages
    sync_install = false, -- install languages asynchronously
    auto_install = true, -- installs missing parsers on opening file
    ignore_install = { "" }, -- list of languages to ignore installing
    highlight = {
        enable = true, -- false disables whole extension
        disable = { "" }, -- list of languages to be disabled for highlight
        additional_vim_regex_highlighting = true,
    },
    indent = { enable = true, disable = { "yaml" } },
    rainbow = {
        enable = true,
        -- disable = {"cpp"}, -- list of languages to be disabled
        extended_mode = true,
        max_file_lines = nil, -- Do not enable for files with more than n lines, int
        colors = { 'hotpink3', 'cyan', 'mediumpurple', 'yellow' }, -- table of hex strings,
        -- termcolors = {}, -- table of colour name strings
    },
    context_commentstring = {
        enable = true,
        enable_autocmd = false,
    },
}

-- HACK: for glitchy rainbow https://github.com/p00f/nvim-ts-rainbow/issues/112#issuecomment-1310835936
vim.api.nvim_command([[
    autocmd BufNewFile,BufReadPost * TSDisable rainbow | TSEnable rainbow | TSDisable rainbow | TSEnable rainbow | TSDisable rainbow | TSEnable rainbow
    autocmd BufWritePost * TSDisable rainbow | TSEnable rainbow
]])
