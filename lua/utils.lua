local M = {}
M.table = {}

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

return M
