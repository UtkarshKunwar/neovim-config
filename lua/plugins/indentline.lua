local status_ok, indent_blankline = pcall(require, "ibl")
if not status_ok then
    return
end

local status_ok_rainbow, rainbow_delimiters =
    pcall(require, "rainbow-delimiters")
if not status_ok_rainbow then
    return
end

local highlight = {
    "RainbowRed",
    "RainbowYellow",
    "RainbowBlue",
    "RainbowOrange",
    "RainbowGreen",
    "RainbowViolet",
    "RainbowCyan",
}

-- create the highlight groups in the highlight setup hook, so they are reset
-- every time the colorscheme changes
-- Uncomment to use rainbow delimiters colours for ibl
local hooks = require("ibl.hooks")
hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
    vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
    vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
    vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
    vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
    vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
    vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
    vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
end)

-- Not using setup() call because of additional overhead according to the documentation.
vim.g.rainbow_delimiters = {
    highlight = highlight,
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

indent_blankline.setup({
    exclude = {
        buftypes = { "terminal", "nofile" },
        filetypes = {
            "help",
            "startify",
            "dashboard",
            "packer",
            "neogitstatus",
            "NvimTree",
            "Trouble",
        },
    },
    indent = {
        char = "▏",
        smart_indent_cap = false,
    },
    scope = {
        enabled = true,
        char = "▏",
        -- highlight = highlight, -- change to highlight from rainbow delim for rainbow ibl
        highlight = "Conceal", -- change to highlight from rainbow delim for rainbow ibl
        -- include = {
        --     node_type = { ["*"] = { "*" } },
        -- },
    },
})

-- Uncomment to use rainbow delimiters colours for ibl
-- hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
