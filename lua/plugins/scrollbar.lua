require("plugins.git.gitsigns")

local status_ok_scrollbar, scrollbar = pcall(require, "scrollbar")
if not status_ok_scrollbar then
    return
end

require("scrollbar.handlers.search").setup({
    override_lens = function() end, -- don't add unnecessary virtual text and clutter
})

scrollbar.setup({
    show_in_active_only = true,
    hide_if_all_visible = true, -- Hides everything if all lines are visible
    handle = {
        blend = 0, -- Integer between 0 and 100. 0 for fully opaque and 100 to full transparent. Defaults to 30.
        text = "  ",
    },
    marks = {
        Cursor = {
            text = "  ",
        },
    },
    handlers = {
        gitsigns = false, -- Requires gitsigns
        search = false, -- Requires hlslens
        diagnostic = false,
    },
})

vim.api.nvim_set_hl(0, "ScrollbarHandle", {
    link = "ColorColumn",
})
vim.api.nvim_set_hl(0, "ScrollbarCursorHandle", {
    link = "ColorColumn",
})
