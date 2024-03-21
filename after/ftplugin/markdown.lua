-- Check if the filetype plugin has already been run for this buffer
if vim.b.markdown_ftplugin then
    return
end

-- Mark the filetype plugin as run for this buffer
vim.b.markdown_ftplugin = true

vim.opt_local.wrap = true
vim.opt_local.textwidth = 80
vim.opt_local.colorcolumn = "+2"
