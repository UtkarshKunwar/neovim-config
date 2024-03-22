-- following options are the default
-- each of these are documented in `:help nvim-tree.OPTION_NAME`

local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
    return
end

local autogen_status_ok, autogen =
    pcall(require, "plugins.nvim-tree.nvim-tree-on-attach")
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
    filters = {
        custom = {
            ".git",
        },
    },
})

-- {{ Auto close functionality
-- From https://github.com/nvim-tree/nvim-tree.lua/wiki/Auto-Close#marvinth01
vim.api.nvim_create_autocmd("QuitPre", {
    callback = function()
        local tree_wins = {}
        local floating_wins = {}
        local wins = vim.api.nvim_list_wins()
        for _, w in ipairs(wins) do
            local bufname =
                vim.api.nvim_buf_get_name(vim.api.nvim_win_get_buf(w))
            if bufname:match("NvimTree_") ~= nil then
                table.insert(tree_wins, w)
            end
            if vim.api.nvim_win_get_config(w).relative ~= "" then
                table.insert(floating_wins, w)
            end
        end
        if 1 == #wins - #floating_wins - #tree_wins then
            -- Should quit, so we close all invalid windows.
            for _, w in ipairs(tree_wins) do
                vim.api.nvim_win_close(w, true)
            end
        end
    end,
})
-- }}
