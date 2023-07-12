vim.g.mkdp_echo_preview_url = 1
vim.g.mkdp_theme = "dark"

local M = {}
M.execute = function ()
    if vim.fn.exists(":MarkdownPreview") > 0 then
        vim.api.nvim_command("MarkdownPreviewToggle")
    else
        print("[INFO] Markdown Preview works only on supported file types")
    end
end

return M
