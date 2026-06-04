local M = {}
M.table = {}
M.list = {}

M.table.deepcopy = function(original_table)
    local orig_type = type(original_table)
    local copy
    if orig_type == "table" then
        copy = {}
        for orig_key, orig_value in next, original_table, nil do
            copy[M.table.deepcopy(orig_key)] = M.table.deepcopy(orig_value)
        end
        setmetatable(copy, M.table.deepcopy(getmetatable(original_table)))
    else -- number, string, boolean, etc
        copy = original_table
    end
    return copy
end

M.table.concat = function(table1, table2)
    local res = {}
    for k, v in pairs(table1) do
        res[k] = v
    end
    for k, v in pairs(table2) do
        res[k] = v
    end
    return res
end

M.list.concat = function(list1, list2)
    local list = {}
    for _, v in ipairs(list1) do
        table.insert(list, v)
    end
    for _, v in ipairs(list2) do
        table.insert(list, v)
    end
    return list
end

M.list.find = function(list1, value)
    for _, v in pairs(list1) do
        if v == value then
            return true
        end
    end
    return false
end

-- State saver {{{
-- Store our saved states here
local saved_state = {
    options = {},
    keymaps = {},
}

M.state_saver = {}

--- Save a global or local option and set a new one
---@param opt_name string The name of the option (e.g., "virtualedit")
---@param temp_value any The temporary value to set
---@param scope table|nil Optional scope, e.g., { buf = 0 } or { win = 0 }
function M.state_saver.set_option(opt_name, temp_value, scope)
    scope = scope or {}

    -- 1. Save the current state if we haven't already in this session
    local current_val = vim.api.nvim_get_option_value(opt_name, scope)

    -- Generate a unique key in case we are saving buffer-local options
    local state_key = opt_name .. (scope.buf or scope.win or "global")

    if saved_state.options[state_key] == nil then
        saved_state.options[state_key] = {
            name = opt_name,
            value = current_val,
            scope = scope,
        }
    end

    -- 2. Set the new value
    vim.api.nvim_set_option_value(opt_name, temp_value, scope)
end

--- Save an existing keymap and set a new one
---@param mode string|table Mode short-name (e.g., "n", "v")
---@param lhs string Left-hand side of the mapping (e.g., "J")
---@param rhs string|function Right-hand side or Lua function
---@param opts table|nil Keymap options (e.g., { noremap = true })
function M.state_saver.set_keymap(mode, lhs, rhs, opts)
    opts = opts or {}
    local buffer = opts.buffer or false

    -- Normalize mode to string for simplicity in saving
    local m = type(mode) == "table" and mode[1] or mode

    -- 1. Get existing map arguments using Vimscript's maparg()
    -- arguments: lhs, mode, abbr, dict
    local existing_map = vim.fn.maparg(lhs, m, false, true)

    local state_key = m .. "_" .. lhs .. "_" .. tostring(buffer)

    -- 2. Store it (if empty, it means no mapping existed)
    if not saved_state.keymaps[state_key] then
        saved_state.keymaps[state_key] = {
            mode = m,
            lhs = lhs,
            buffer = buffer,
            mapargs = vim.tbl_isempty(existing_map) and nil or existing_map,
        }
    end

    -- 3. Set the new temporary mapping
    vim.keymap.set(mode, lhs, rhs, opts)
end

--- Restore all saved options and keymaps to their original state
function M.state_saver.restore()
    -- Restore Options
    for _, opt_data in pairs(saved_state.options) do
        vim.api.nvim_set_option_value(
            opt_data.name,
            opt_data.value,
            opt_data.scope
        )
    end
    saved_state.options = {} -- Clear state

    -- Restore Keymaps
    for _, map_data in pairs(saved_state.keymaps) do
        local opts_buffer = map_data.buffer == false and nil or map_data.buffer

        if not map_data.mapargs then
            -- If it didn't exist before, delete our temporary one
            pcall(
                vim.keymap.del,
                map_data.mode,
                map_data.lhs,
                { buffer = opts_buffer }
            )
        else
            -- If it did exist, reconstruct it from mapargs
            local m_args = map_data.mapargs
            local restore_opts = {
                expr = m_args.expr == 1,
                noremap = m_args.noremap == 1,
                nowait = m_args.nowait == 1,
                script = m_args.script == 1,
                silent = m_args.silent == 1,
                buffer = opts_buffer,
                desc = m_args.desc,
            }
            -- mapargs.callback contains Lua functions, rhs contains string commands
            local rhs = m_args.callback or m_args.rhs or ""
            vim.keymap.set(map_data.mode, map_data.lhs, rhs, restore_opts)
        end
    end
    saved_state.keymaps = {} -- Clear state
end

-- }}}

return M
