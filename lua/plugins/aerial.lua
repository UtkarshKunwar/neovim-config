local status_ok, aerial = pcall(require, "aerial")
if not status_ok then
    return
end

local icons_status_ok, icons = pcall(require, "plugins.icons")
if not icons_status_ok then
    return
end

local function get_keys(t)
    local keys = {}
    for key, _ in pairs(t) do
        table.insert(keys, tostring(key))
    end
    return keys
end

aerial.setup({
    default_direction = "right",
    max_width = { 40, 0.2 },
    width = nil,
    min_width = 20,
    show_guides = true,
    guides = {
        -- When the child item has a sibling below it
        mid_item = "├─",
        -- When the child item is the last in the list
        last_item = "└─",
        -- When there are nested child guides to the right
        nested_top = "│",
        -- Raw indentation
        whitespace = "  ",
    },
    icons = icons,
    filter_kind = get_keys(icons),
    resize_to_content = false,
    highlight_on_hover = true,
    autojump = true,
})
