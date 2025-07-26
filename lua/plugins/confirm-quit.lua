-- Blacklisted file types for always quitting if encountering these
local always_quit_filetypes = { "qf", "notify", "NvimTree", "aerial" }

local utils = require("utils")

local toggleterm_status, toggleterm = pcall(require, "toggleterm.terminal")

-- Define a custom function to run instead of :q
--- @param force boolean: force quit or not
function SmartQuit(force)
    print("") -- empty to clear command line
    local n_listed_buffers = #vim.fn.getbufinfo({ buflisted = 1 })
    local is_current_buffer_hidden = not vim.bo[0].buflisted

    local current_buf = vim.fn.bufnr("%")
    local current_buf_ft =
        vim.api.nvim_get_option_value("filetype", { buf = current_buf })
    local is_blacklisted_ft =
        utils.list.find(always_quit_filetypes, current_buf_ft)

    -- Count actual number of windows with relevant filetype
    -- https://www.reddit.com/r/neovim/comments/thynt9/what_api_to_get_the_current_count_of_windows/
    local windows = vim.api.nvim_tabpage_list_wins(0)
    local relevant_windows = 0
    for _, v in pairs(windows) do
        local cfg = vim.api.nvim_win_get_config(v)
        local ft = vim.api.nvim_get_option_value(
            "filetype",
            { buf = vim.api.nvim_win_get_buf(v) }
        )
        if
            (cfg.relative == "" or cfg.external == false)
            and not utils.list.find(always_quit_filetypes, ft)
        then
            relevant_windows = relevant_windows + 1
        end
    end
    local is_window = relevant_windows > 1
    local toggleterms_open = 0
    if toggleterm_status then
        toggleterms_open = #toggleterm.get_all()
    end

    if
        is_current_buffer_hidden
        or is_blacklisted_ft
        or (is_window and n_listed_buffers >= 1)
        or force
    then
        local quit_cmd = force and "q!" or "q"
        vim.cmd(quit_cmd)
        -- Check if quit buffer still exists after quitting. If yes then clean up
        if vim.fn.bufexists(current_buf) == 1 and n_listed_buffers > 1 then
            vim.cmd("BufDel " .. current_buf)
        end
    elseif n_listed_buffers > 1 then
        vim.cmd("BufDel " .. current_buf)
    elseif toggleterms_open > 0 then
        vim.notify(
            "Terminal(s) open. Cannot exit without closing.",
            vim.log.levels.ERROR
        )
    else
        -- Prompt the user for input
        vim.ui.select(
            { "Yes", "No" },
            { prompt = "Do you really want to quit?" },
            function(selected)
                if selected == "Yes" then
                    vim.cmd("q")
                end
            end
        )
    end
end

function SmartWriteQuit(force)
    vim.cmd("w")
    SmartQuit(force)
end

function SmartQuitAll(force)
    vim.cmd("BufDelOthers")
    SmartQuit(force)
end

-- Creates a cnoreabbrev matcher replacer for convenience
--- @param cmd string: The original command
--- @param alias string: The alias to replace the original command
--- @return string: The command to register with vim.cmd
local function register_command_alias(cmd, alias)
    return "cnoreabbrev <expr> "
        .. cmd
        .. ' (getcmdtype() == ":" && getcmdline() ==# "'
        .. cmd
        .. '") ? "'
        .. alias
        .. '" : "'
        .. cmd
        .. '"'
end

-- Create an autocmd that intercepts :q and calls the custom function
local command_opts = { force = true, bang = true }

vim.api.nvim_create_user_command("SmartQuit", function(opts)
    SmartQuit(opts.bang)
end, command_opts)
vim.api.nvim_create_user_command("SmartQuitAll", function(opts)
    SmartQuitAll(opts.bang)
end, command_opts)
vim.api.nvim_create_user_command("SmartWriteQuit", function(opts)
    SmartWriteQuit(opts.bang)
end, command_opts)

vim.cmd(register_command_alias("q", "SmartQuit"))
vim.cmd(register_command_alias("qq", "quit"))
vim.cmd(register_command_alias("qa", "SmartQuitAll"))
vim.cmd(register_command_alias("wq", "SmartWriteQuit"))
vim.cmd(register_command_alias("wqq", "x"))
