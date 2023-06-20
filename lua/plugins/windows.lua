local status_ok, windows = pcall(require, "windows")
if not status_ok then
    return
end

-- windows.setup({
--     autowidth = {
--         enable = false,
--         winwidth = 20,
--     },
--     ignore = {
--         buftype = { "quickfix" },
--         filetype = { "NvimTree", "neo-tree", "undotree", "gundo", "aerial" },
--     },
-- })
