local status_ok, nvim_notify = pcall(require, "notify")
if not status_ok then
    return
end

vim.notify = nvim_notify
nvim_notify.setup({
    timeout = 2500,
    stages = "slide",
})
