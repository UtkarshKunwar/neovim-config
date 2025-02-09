local M = {}

local function file_exists(filename)
    local f = io.open(filename, "r")
    if f then
        f:close()
        return true
    end
    return false
end

M.read_quotes = function(filename)
    -- Return an empty table if the file doesn't exist
    if not file_exists(filename) then
        return {}
    end

    local quotes = {}
    local current_quote = nil
    local current_source = ""

    for line in io.lines(filename) do
        local trimmed = line:match("^%s*(.-)%s*$") -- Trim spaces

        -- If a new list item starts, process the previous quote
        if trimmed:match("^%- ") then
            -- Save the previous quote if there was one
            if current_quote then
                table.insert(quotes, { current_quote, "", current_source })
            end

            -- Extract quote and optional source
            local quote, source = trimmed:match("^%- (.-)%s*(-%s*[^%-]+)$")
            if not quote then
                quote = trimmed:match("^%- (.+)")
                source = ""
            end

            -- Start a new quote
            current_quote = quote
            current_source = source
        elseif current_quote then
            -- Append to the current quote (for multi-line quotes)
            current_quote = current_quote .. " " .. trimmed
        end
    end

    -- Save the last quote
    if current_quote then
        table.insert(quotes, { current_quote, "", current_source })
    end

    return quotes
end

return M
