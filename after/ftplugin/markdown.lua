-- Check if the filetype plugin has already been run for this buffer
if vim.b.markdown_ftplugin then
    return
end

-- Mark the filetype plugin as run for this buffer
vim.b.markdown_ftplugin = true

vim.opt.wrap = true
vim.opt.textwidth = 80

-- Set tab and indentation behavior specifically for Markdown files
-- This is based on how mdformat formats the Markdown files.
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
