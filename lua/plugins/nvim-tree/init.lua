-- following options are the default
-- each of these are documented in `:help nvim-tree.OPTION_NAME`

local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
    return
end

local config_status_ok, _ = pcall(require, "nvim-tree.config")
if not config_status_ok then
    return
end

local autogen_status_ok, autogen = pcall(require, "plugins.nvim-tree.nvim-tree-on-attach")
if not autogen_status_ok then
    return
end

-- local tree_cb = nvim_tree_config.nvim_tree_callback


local function open_nvim_tree(data)
    local IGNORED_FT = {
        "startify",
        "dashboard",
        "alpha",
    }

    -- &ft
    local filetype = vim.bo[data.buf].ft

    -- skip ignored filetypes
    if vim.tbl_contains(IGNORED_FT, filetype) then
        return
    end
end


vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })

nvim_tree.setup {
    on_attach = autogen.on_attach,
}

-- {{ Auto close functionality
-- nvim-tree is also there in modified buffers so this function filter it out
local modifiedBufs = function(bufs)
    local t = 0
    for _, v in pairs(bufs) do
        if v.name:match("NvimTree_") == nil then
            t = t + 1
        end
    end
    return t
end

vim.api.nvim_create_autocmd("BufEnter", {
    nested = true,
    callback = function()
        if #vim.api.nvim_list_wins() == 1 and
            vim.api.nvim_buf_get_name(0):match("NvimTree_") ~= nil and
            modifiedBufs(vim.fn.getbufinfo({ bufmodified = 1 })) == 0 then
            vim.cmd "quit"
        end
    end
})
-- }}
