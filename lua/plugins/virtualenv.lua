local status_ok, venv = pcall(require, "venv-selector")
if not status_ok then
    return
end

venv.setup({
    search_venv_managers = true,
    auto_refresh = true,
    search = false,
})
