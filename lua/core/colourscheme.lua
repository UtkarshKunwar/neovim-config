local status_ok, catppuccin = pcall(require, "catppuccin")
if not status_ok then
    return
end

catppuccin.setup({
    integrations = {
        aerial = true,
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        hop = false,
        treesitter = true,
        treesitter_context = true,
        which_key = false,
        notify = true,
        mason = true,
        markdown = true,
        mini = {
            enabled = true,
            indentscope_color = "",
        },
        symbols_outline = true,
        native_lsp = {
            enabled = true,
            virtual_text = {
                errors = { "italic" },
                hints = { "italic" },
                warnings = { "italic" },
                information = { "italic" },
            },
            underlines = {
                errors = { "underline" },
                hints = { "underline" },
                warnings = { "underline" },
                information = { "underline" },
            },
            inlay_hints = {
                background = true,
            },
        },
        navic = {
            enabled = true,
            custom_bg = "NONE", -- "lualine" will set background to mantle
        },
    },
})

vim.cmd.colorscheme("catppuccin")

vim.cmd([[highlight! Visual guibg=#505783 gui=nocombine]])
