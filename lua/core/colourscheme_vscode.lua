local status_ok, vscode = pcall(require, "vscode")
if not status_ok then
    return
end

vim.o.background = "dark"

local c = require("vscode.colors")
vscode.setup({
    -- Enable transparent background
    transparent = false,

    -- Enable italic comment
    italic_comments = true,

    -- Disable nvim-tree background color
    disable_nvimtree_bg = true,

    -- Override colors (see ./lua/vscode/colors.lua)
    color_overrides = {
        vscLineNumber = "#777777",
    },

    -- Override highlight groups (see ./lua/vscode/theme.lua)
    group_overrides = {
        -- this supports the same val table as vim.api.nvim_set_hl
        -- use colors from this colorscheme by requiring vscode.colors!
        Cursor = { fg = c.vscDarkBlue, bg = c.vscLightGreen, bold = true },
        CursorLine = { fg = c.vscDarkBlue, bg = "#2f2f2f", bold = false },
        ColorColumn = { fg = c.vscDarkBlue, bg = "#2f2f2f", bold = false },
    },
})
vscode.load()
