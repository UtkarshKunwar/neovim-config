local status_ok, _ = pcall(require, "venn")
if not status_ok then
    return
end

local status_hydra_ok, Hydra = pcall(require, "hydra")
if not status_hydra_ok then
    return
end

local state_saver = require("utils").state_saver

-- Helper function to change the brush state
local function set_brush(style, name)
    vim.b.venn_brush = style
    print("Brush set to: " .. name)
end

-- Helper function to dynamically generate the keystrokes for lines
local function draw_line(dir)
    -- If venn_brush is nil, default to "" (Single line)
    local brush = vim.b.venn_brush or ""
    return "<C-v>" .. dir .. ":VBox" .. brush .. "<CR>"
end

-- Helper function for the visual box
local function draw_box()
    local brush = vim.b.venn_brush or ""
    return ":VBox" .. brush .. "<CR>"
end

local hint = [[
        ┌──────────────┐
        │ DRAWING MODE │
        └──────────────┘
 
 Brush Styles (Current: %{brush_name}):
        _1_ Single ───► 
        _2_ Double ═══► 
        _3_ Heavy  ━━━► 
 
                 ▲ 
 Draw Line:    ◀   ▶   (Arrows) 
                 ▼ 
 
 Draw Box : _f_ (Visual selection) 
 
 _<ESC>_/_<leader>d_ to exit 
]]

Hydra({
    name = "Draw Diagram",
    hint = hint,
    config = {
        color = "pink",
        invoke_on_body = true,
        hint = {
            position = "bottom-right",
            float_opts = {
                border = "rounded",
            },
            funcs = {
                brush_name = function()
                    if vim.b.venn_brush == "D" then
                        return "Double"
                    end
                    if vim.b.venn_brush == "H" then
                        return "Heavy"
                    end
                    return "Single"
                end,
            },
        },
        on_enter = function()
            -- Reset brush to Single line on start
            state_saver.set_option("virtualedit", "all", { win = 0 })
        end,
        on_exit = function()
            vim.b.venn_brush = ""
            state_saver.restore()
        end,
    },
    mode = "n",
    body = "<leader>d",
    heads = {
        -- Change Brush Style
        {
            "1",
            function()
                set_brush("", "Single")
            end,
            { desc = "Single" },
        },
        {
            "2",
            function()
                set_brush("D", "Double")
            end,
            { desc = "Double" },
        },
        {
            "3",
            function()
                set_brush("H", "Heavy")
            end,
            { desc = "Heavy" },
        },

        -- Draw Lines (expr = true tells Neovim to execute the returned string)
        {
            "<Left>",
            function()
                return draw_line("h")
            end,
            { expr = true, desc = false },
        },
        {
            "<Down>",
            function()
                return draw_line("j")
            end,
            { expr = true, desc = false },
        },
        {
            "<Up>",
            function()
                return draw_line("k")
            end,
            { expr = true, desc = false },
        },
        {
            "<Right>",
            function()
                return draw_line("l")
            end,
            { expr = true, desc = false },
        },

        -- Draw Box
        {
            "f",
            function()
                return draw_box()
            end,
            { mode = "v", expr = true },
        },

        -- Exit key
        { "<ESC>", nil, { exit = true, nowait = true } },
        { "<leader>d", nil, { exit = true, nowait = true } },
    },
})
