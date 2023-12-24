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
    local table = {}
    for k, v in pairs(table1) do
        table[k] = v
    end
    for k, v in pairs(table2) do
        table[k] = v
    end
    return table
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

return M
