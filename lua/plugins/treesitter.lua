local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
    return
end

configs.setup {
    ensure_installed = "all", -- one of "all" or a list of languages
    sync_install = false, -- install languages asynchronously
    auto_install = true, -- installs missing parsers on opening file
    ignore_install = {""}, -- list of languages to ignore installing
    highlight = {
        enable = true, -- false disables whole extension
        disable = {""}, -- list of languages to be disabled for highlight
        additional_vim_regex_highlighting = true,
    },
    indent = {enable = true, disable = {"yaml"}},
    rainbow = {
        enable = true,
        -- disable = {"cpp"}, -- list of languages to be disabled
        extended_mode = true,
        max_file_lines = nil, -- Do not enable for files with more than n lines, int
        -- colors = {}, -- table of hex strings,
        -- termcolors = {}, -- table of colour name strings
    }
}
