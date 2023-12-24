-- Define a custom function to run instead of :q
--- @param force boolean: force quit or not
function SmartQuit(force)
    print("") -- empty to clear command line
    local n_listed_buffers = #vim.fn.getbufinfo({ buflisted = true })
    local is_current_buffer_hidden = not vim.bo[0].buflisted
    local is_window = #vim.api.nvim_list_wins() > 1

    if is_current_buffer_hidden or (is_window and n_listed_buffers == 1) or force then
        local quit_cmd = force and "q!" or "q"
        vim.cmd(quit_cmd)
    elseif n_listed_buffers > 1 then
        vim.cmd("BufDel")
    else
        -- Prompt the user for input
        vim.ui.select({ "Yes", "No" }, { prompt = "Do you really want to quit?" }, function(selected)
            if selected == "Yes" then
                vim.cmd("q")
            end
        end)
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
