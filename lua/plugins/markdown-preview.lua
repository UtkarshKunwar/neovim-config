vim.g.mkdp_echo_preview_url = 1
vim.g.mkdp_theme = "dark"
vim.g.mkdp_browser = "google-chrome"
vim.g.mkdp_auto_close = 0
vim.g.mkdp_combine_preview = 1
vim.g.mkdp_combine_preview_auto_refresh = 1

local M = {}
M.execute = function ()
    if vim.fn.exists(":MarkdownPreview") > 0 then
        vim.api.nvim_command("MarkdownPreviewToggle")
    else
        print("[INFO] Markdown Preview works only on supported file types")
    end
end

return M
