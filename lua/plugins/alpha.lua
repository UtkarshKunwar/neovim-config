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

-- Get the markdown file path relative to the script location
local script_path = debug.getinfo(1).source:sub(2)
local script_dir = script_path:match("(.*/)")
local filename = script_dir .. "quotes.md"
local quotes = require("plugins.quotes_md_reader").read_quotes(filename)
local fortune_quotes = require("alpha.quotes")
local utils = require("utils")

local fortune_options = {
    max_width = 120,
    -- quotes = { -- Your own list
    --     -- {"Quote", '', '- Author'},
    -- }
    quotes = utils.table.concat(fortune_quotes, quotes),
}
dashboard.section.footer.val = fortune(fortune_options)
dashboard.section.footer.opts.hl = "Type"
dashboard.section.footer.opts.height = 20

dashboard.opts.opts.noautocmd = true
alpha.setup(dashboard.opts)
