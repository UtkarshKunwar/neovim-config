local status_ok, alpha = pcall(require, "alpha")
if not status_ok then
    return
end

local dashboard = require("alpha.themes.dashboard")
local fortune = require("alpha.fortune")
local logo = require("plugins.logos.neovim")

dashboard.section.header.val = logo
dashboard.section.buttons.val = {
    dashboard.button("f", "  Find file", ":Telescope find_files <CR>"),
    dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
    dashboard.button("p", "  Find project", ":Telescope projects <CR>"),
    dashboard.button(
        "r",
        "  Recently used files",
        ":Telescope oldfiles <CR>"
    ),
    dashboard.button("t", "  Find text", ":Telescope live_grep <CR>"),
    dashboard.button(
        "c",
        "  Configuration",
        ":e ~/.config/nvim/init.lua <CR>"
    ),
    dashboard.button("q", "  Quit Neovim", ":qa<CR>"),
}

dashboard.section.footer.opts.hl = "Type"
dashboard.section.header.opts.hl = "Include"
dashboard.section.buttons.opts.hl = "Keyword"

local fortune_options = {
    max_width = 100,
    -- quotes = { -- Your own list
    --     -- {"Quote", '', '- Author'},
    -- }
}
dashboard.section.footer.val = fortune(fortune_options)
dashboard.section.footer.opts.hl = "Type"

dashboard.opts.opts.noautocmd = true
alpha.setup(dashboard.opts)
