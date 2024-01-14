-- following options are the default
-- each of these are documented in `:help nvim-tree.OPTION_NAME`

local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
    return
end

local autogen_status_ok, autogen = pcall(require, "plugins.nvim-tree.nvim-tree-on-attach")
if not autogen_status_ok then
    return
end

local function open_nvim_tree(data)
    local IGNORED_FT = {
        "startify",
        "dashboard",
        "alpha",
        "notify",
    }

    -- &ft
    local filetype = vim.bo[data.buf].ft

    -- skip ignored filetypes
    if vim.tbl_contains(IGNORED_FT, filetype) then
        return
    end
end

vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })

nvim_tree.setup({
    on_attach = autogen.on_attach,
    update_focused_file = {
        enable = true,
        update_root = true,
    },
    view = {
        width = 25,
    },
})

-- {{ Auto close functionality
-- From https://github.com/nvim-tree/nvim-tree.lua/wiki/Auto-Close#rwblokzijl
local function tab_win_closed(winnr)
    local api = require("nvim-tree.api")
    local tabnr = vim.api.nvim_win_get_tabpage(winnr)
    local bufnr = vim.api.nvim_win_get_buf(winnr)
    local buf_info = vim.fn.getbufinfo(bufnr)[1]
    local tab_wins = vim.tbl_filter(function(w)
        return w ~= winnr
    end, vim.api.nvim_tabpage_list_wins(tabnr))
    local tab_bufs = vim.tbl_map(vim.api.nvim_win_get_buf, tab_wins)
    if buf_info.name:match(".*NvimTree_%d*$") then -- close buffer was nvim tree
        -- Close all nvim tree on :q
        if not vim.tbl_isempty(tab_bufs) then -- and was not the last window (not closed automatically by code below)
            api.tree.close()
        end
    else -- else closed buffer was normal buffer
        if #tab_bufs == 1 then -- if there is only 1 buffer left in the tab
            local last_buf_info = vim.fn.getbufinfo(tab_bufs[1])[1]
            if last_buf_info.name:match(".*NvimTree_%d*$") then -- and that buffer is nvim tree
                vim.schedule(function()
                    if #vim.api.nvim_list_wins() == 1 then -- if its the last buffer in vim
                        vim.cmd("quit") -- then close all of vim
                    else -- else there are more tabs open
                        vim.api.nvim_win_close(tab_wins[1], true) -- then close only the tab
                    end
                end)
            end
        end
    end
end

vim.api.nvim_create_autocmd("WinClosed", {
    callback = function()
        local winnr = tonumber(vim.fn.expand("<amatch>"))
        vim.schedule_wrap(tab_win_closed(winnr))
    end,
    nested = true,
})
-- }}
