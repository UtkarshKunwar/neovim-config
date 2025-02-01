local status_ok, venv = pcall(require, "venv-selector")
if not status_ok then
    return
end

venv.setup({
    search_venv_managers = true,
    auto_refresh = true,
    search = false,
    stay_on_this_version = true,
})

-- https://github.com/linux-cultist/venv-selector.nvim?tab=readme-ov-file#-automate
vim.api.nvim_create_autocmd("VimEnter", {
    desc = "Auto select virtualenv on nvim open",
    pattern = "*",
    callback = function()
        local patterns = { ".python-version", ".git", "pyproject.toml" }

        -- Function to check for the existence of any of the specified files
        local function find_file()
            for _, path in ipairs(patterns) do
                local found_file = vim.fn.findfile(path, vim.fn.getcwd() .. ";")
                if found_file ~= "" then
                    return path, found_file
                end
                local found_dir = vim.fn.finddir(path, vim.fn.getcwd() .. ";")
                if found_file ~= "" then
                    return path, found_dir
                end
            end
            return nil, nil
        end

        local path, found_path = find_file()

        if path == ".python-version" then
            local virtualenvs = vim.fn.readfile(found_path)[1] -- Read the first line of the file
            if virtualenvs then
                local virtualenv = vim.split(virtualenvs, ",")[1]
                if virtualenv and virtualenv ~= "" then
                    local virtualenv_path = vim.fn.expand("~/.virtualenvs/")
                        .. virtualenv
                    -- https://github.com/linux-cultist/venv-selector.nvim/blob/2ad34f36d498ff5193ea10f79c87688bd5284172/lua/venv-selector/venv.lua#L208C7-L208C47
                    require("venv-selector.venv").set_venv_and_system_paths({
                        value = virtualenv_path,
                    })
                    require("venv-selector.venv").cache_venv(virtualenv_path)
                end
            end
        else
            venv.retrieve_from_cache()
        end
    end,
    once = true,
})
