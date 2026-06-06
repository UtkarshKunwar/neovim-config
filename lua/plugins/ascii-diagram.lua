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

-- Helper function to scope AsciiBlockify to a visual selection
local function blockify_selection()
    -- Exit visual mode to lock in the '< and '> marks
    local mode = vim.fn.mode()
    if mode == "v" or mode == "V" or mode == "\22" then
        vim.api.nvim_feedkeys(
            vim.api.nvim_replace_termcodes("<Esc>", true, false, true),
            "n",
            true
        )
    end

    -- Schedule execution so marks update properly
    vim.schedule(function()
        local bufnr = vim.api.nvim_get_current_buf()
        local start_pos = vim.fn.getpos("'<")
        local end_pos = vim.fn.getpos("'>")

        -- Convert to 0-indexed rows for the API
        local start_row = start_pos[2] - 1
        local end_row = end_pos[2]

        -- 1. Grab the lines from the visual selection
        local lines =
            vim.api.nvim_buf_get_lines(bufnr, start_row, end_row, false)

        -- 2. Create a hidden scratch buffer and paste the lines
        local scratch_buf = vim.api.nvim_create_buf(false, true)
        vim.api.nvim_buf_set_lines(scratch_buf, 0, -1, false, lines)

        -- 3. Temporarily switch window to the scratch buffer
        local current_win = vim.api.nvim_get_current_win()
        vim.api.nvim_win_set_buf(current_win, scratch_buf)

        -- 4. Run the plugin command (safely isolated)
        vim.cmd("silent! AsciiBlockify")

        -- 5. Grab the modified lines
        local modified_lines =
            vim.api.nvim_buf_get_lines(scratch_buf, 0, -1, false)

        -- 6. Restore original buffer, delete scratch, and update lines
        vim.api.nvim_win_set_buf(current_win, bufnr)
        vim.api.nvim_buf_delete(scratch_buf, { force = true })
        vim.api.nvim_buf_set_lines(
            bufnr,
            start_row,
            end_row,
            false,
            modified_lines
        )
    end)
end

-- Helper function to modify box style (Rounded, Sharp, ASCII)
local function modify_box_style(style)
    -- Exit visual mode if active so we can reliably target the '<,'> marks
    local mode = vim.fn.mode()
    if mode == "v" or mode == "V" or mode == "\22" then
        vim.api.nvim_feedkeys(
            vim.api.nvim_replace_termcodes("<Esc>", true, false, true),
            "n",
            true
        )
    end

    -- Schedule the substitutions to run after exiting visual mode
    vim.schedule(function()
        local cmds = {}
        if style == "rounded" then
            -- Catch all corners (thin, heavy, double) and make them rounded
            cmds = {
                [[silent! keeppatterns '<,'>s/[┌┏╔]/╭/ge]],
                [[silent! keeppatterns '<,'>s/[┐┓╗]/╮/ge]],
                [[silent! keeppatterns '<,'>s/[└┗╚]/╰/ge]],
                [[silent! keeppatterns '<,'>s/[┘┛╝]/╯/ge]],

                -- Downgrade heavy/double straight lines to thin so they connect properly
                -- Main Conversion: Convert ALL horizontal lines and dashes to Unicode
                [[silent! keeppatterns '<,'>s/[-━═]/─/ge]],

                -- HEAL: Restore Markdown bullets (- item) at the start of the line
                [[silent! keeppatterns '<,'>s/^\(\s*\)─\(\s\)/\1-\2/ge]],

                -- HEAL: Restore Lua/Haskell comments (-- comment) at start or inline
                -- Matches exactly two '─' preceded by space/start and followed by a non-'─'
                [[silent! keeppatterns '<,'>s/^\(\s*\)──\([^─]\)/\1--\2/ge]],
                [[silent! keeppatterns '<,'>s/\(\s\)──\([^─]\)/\1--\2/ge]],

                -- HEAL: Restore LDoc/Doxygen comments (--- comment) at start or inline
                -- Matches exactly three '─' preceded by space/start and followed by a non-'─'
                [[silent! keeppatterns '<,'>s/^\(\s*\)───\([^─]\)/\1---\2/ge]],
                [[silent! keeppatterns '<,'>s/\(\s\)───\([^─]\)/\1---\2/ge]],

                [[silent! keeppatterns '<,'>s/[|┃║]/│/ge]],

                -- Downgrade heavy/double intersections to thin
                [[silent! keeppatterns '<,'>s/[┳╦]/┬/ge]],
                [[silent! keeppatterns '<,'>s/[┻╩]/┴/ge]],
                [[silent! keeppatterns '<,'>s/[┣╠]/├/ge]],
                [[silent! keeppatterns '<,'>s/[┫╣]/┤/ge]],
                [[silent! keeppatterns '<,'>s/[╋╬]/┼/ge]],
            }
        elseif style == "sharp" then
            -- Intelligently restore sharp corners based on the CURRENT brush
            local brush = vim.b.venn_brush or ""
            local tl, tr, bl, br = "┌", "┐", "└", "┘" -- Default Thin

            if brush == "H" then
                tl, tr, bl, br = "┏", "┓", "┗", "┛" -- Heavy
            elseif brush == "D" then
                tl, tr, bl, br = "╔", "╗", "╚", "╝" -- Double
            end

            cmds = {
                [[silent! keeppatterns '<,'>s/╭/]] .. tl .. [[/ge]],
                [[silent! keeppatterns '<,'>s/╮/]] .. tr .. [[/ge]],
                [[silent! keeppatterns '<,'>s/╰/]] .. bl .. [[/ge]],
                [[silent! keeppatterns '<,'>s/╯/]] .. br .. [[/ge]],

                -- Downgrade heavy/double straight lines to thin so they connect properly
                -- Main Conversion: Convert ALL horizontal lines and dashes to Unicode
                [[silent! keeppatterns '<,'>s/[-━═]/─/ge]],

                -- HEAL: Restore Markdown bullets (- item) at the start of the line
                [[silent! keeppatterns '<,'>s/^\(\s*\)─\(\s\)/\1-\2/ge]],

                -- HEAL: Restore Lua/Haskell comments (-- comment) at start or inline
                -- Matches exactly two '─' preceded by space/start and followed by a non-'─'
                [[silent! keeppatterns '<,'>s/^\(\s*\)──\([^─]\)/\1--\2/ge]],
                [[silent! keeppatterns '<,'>s/\(\s\)──\([^─]\)/\1--\2/ge]],

                -- HEAL: Restore LDoc/Doxygen comments (--- comment) at start or inline
                -- Matches exactly three '─' preceded by space/start and followed by a non-'─'
                [[silent! keeppatterns '<,'>s/^\(\s*\)───\([^─]\)/\1---\2/ge]],
                [[silent! keeppatterns '<,'>s/\(\s\)───\([^─]\)/\1---\2/ge]],

                [[silent! keeppatterns '<,'>s/[|┃║]/│/ge]],

                -- Downgrade heavy/double intersections to thin
                [[silent! keeppatterns '<,'>s/[┳╦]/┬/ge]],
                [[silent! keeppatterns '<,'>s/[┻╩]/┴/ge]],
                [[silent! keeppatterns '<,'>s/[┣╠]/├/ge]],
                [[silent! keeppatterns '<,'>s/[┫╣]/┤/ge]],
                [[silent! keeppatterns '<,'>s/[╋╬]/┼/ge]],
            }
        elseif style == "ascii" then
            cmds = {
                -- 1. Intersections (Only true 4-way crosses) -> '+'
                [[silent! keeppatterns '<,'>s/[┌┍┎┏┐┑┒┓└┕┖┗┘┙┚┛╭╮╰╯╓╖╙╜┼┽┾┿╀╁╂╃╄╅╆╇╈╉╊╋╪╫╬]/+/ge]],

                -- 2. Double Horizontal Lines & Corners -> '='
                -- (Keeps double lines distinct from single lines)
                [[silent! keeppatterns '<,'>s/[═╒╔╕╗╘╚╛╝╤╦╧╩]/=/ge]],

                -- 3. Single Horizontal Lines, Corners, & Top/Bottom T-Junctions -> '-'
                [[silent! keeppatterns '<,'>s/[─━┄┅┈┉╌╍┬┭┮┯┰┱┲┳┴┵┶┷┸┹┺┻╥╨╴╶╸╺╼╾]/-/ge]],

                -- 4. Vertical Lines & Left/Right T-Junctions -> '|'
                [[silent! keeppatterns '<,'>s/[│┃┆┇┊┋╎╏├┝┞┟┠┡┢┣┤┥┦┧┨┩┪┫╞╟╠╡╢╣║╵╷╻╹╽╿]/|/ge]],

                -- 5. Arrows
                [[silent! keeppatterns '<,'>s/[►▶]/>/ge]],
                [[silent! keeppatterns '<,'>s/[◄◀]/</ge]],
                [[silent! keeppatterns '<,'>s/▲/^/ge]],
                [[silent! keeppatterns '<,'>s/▼/v/ge]],
            }
        end

        for _, cmd in ipairs(cmds) do
            vim.cmd(cmd)
        end
    end)
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
 
 =============================== 
 Visual Mode Operations
 
 Draw Box: _f_
 
 Transform (Lossy): 
   _4_ Rounded ╭╮   _5_ Sharp ┌┐
             ╰╯           └┘
   _6_ ASCII ++     _7_ UTF-8 Box
           ++       from ASCII 
 
 =============================== 
 
 _<ESC>_/_<leader>f_ to exit 
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
    body = "<leader>f",
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

        -- Transform Styles
        {
            "4",
            function()
                modify_box_style("rounded")
            end,
            { mode = "v", desc = "Rounded" },
        },
        {
            "5",
            function()
                modify_box_style("sharp")
            end,
            { mode = "v", desc = "Sharp" },
        },
        {
            "6",
            function()
                modify_box_style("ascii")
            end,
            { mode = "v", desc = "ASCII" },
        },
        {
            "7",
            function()
                blockify_selection()
            end,
            { mode = "v", desc = "Unicode" },
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

        -- Exit keys
        { "<ESC>", nil, { exit = true, nowait = true } },
        { "<leader>f", nil, { exit = true, nowait = true } },
    },
})
