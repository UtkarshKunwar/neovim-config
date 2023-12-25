if vim.g.neovide then
    return
end

local status_ok, neoscroll = pcall(require, "neoscroll")
if not status_ok then
    return
end

neoscroll.setup({
    mappings = { "<C-u>", "<C-d>", "<C-b>", "<C-y>", "<C-e>", "zt", "zz", "zb" }, -- removed <C-f> because already mapped to find files
    easing_function = "quadratic",
    pre_hook = function()
        vim.opt.eventignore:append({
            "WinScrolled",
            "CursorMoved",
        })
    end,
    post_hook = function()
        vim.opt.eventignore:remove({
            "WinScrolled",
            "CursorMoved",
        })
    end,
})
