local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
    return
end

local hide_in_width = function()
    return vim.fn.winwidth(0) > 80
end

local diagnostics = {
    "diagnostics",
    sources = { "nvim_diagnostic" },
    sections = { "error", "warn" },
    symbols = { error = " ", warn = " " },
    colored = false,
    update_in_insert = false,
    always_visible = true,
    on_click = function()
        vim.api.nvim_command("Telescope diagnostics bufnr=0 theme=ivy")
    end,
}

local diff = {
    "diff",
    colored = false,
    symbols = { added = " ", modified = " ", removed = " " }, -- changes diff symbols
    cond = hide_in_width,
}

local filetype = {
    "filetype",
    icons_enabled = true,
    icon = nil,
}

local branch = {
    "branch",
    icons_enabled = true,
    icon = "",
    on_click = function()
        vim.api.nvim_command("Telescope git_branches theme=ivy")
    end,
}

local location = {
    "location",
    padding = 1,
}

local progress = {
    "progress",
    padding = 2,
}

local navic = {
    "navic",
    color_correction = nil,
    navic_opts = nil,
    padding = 6,
    draw_empty = true,
    color = "Normal",
}

local spaces = function()
    return "spaces: "
        .. vim.api.nvim_get_option_value("shiftwidth", { buf = 0 })
end

local actived_venv = function()
    local venv_name = require("venv-selector").get_active_venv()
    if venv_name ~= nil then
        return string.gsub(venv_name, ".*virtualenvs/", " ")
    else
        return ""
    end
end

local venv = {
    actived_venv,
    on_click = function(_, btn, _)
        if btn == "r" then
            local active_venv = require("venv-selector").get_active_venv()
            if not active_venv then
                vim.notify(
                    "No virtual environment active",
                    vim.log.levels.WARN,
                    { title = "VenvSelect" }
                )
                return
            end
            local venv_name = string.gsub(active_venv, ".*virtualenvs/", "")
            require("venv-selector").deactivate_venv()
            vim.notify(
                'Deactivated virtual environment "' .. venv_name .. '"',
                vim.log.levels.INFO,
                { title = "VenvSelect" }
            )
        else
            vim.api.nvim_command("VenvSelect")
        end
    end,
    update_in_insert = false,
    always_visible = true,
}

lualine.setup({
    options = {
        icons_enabled = true,
        theme = "catppuccin",
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
        disabled_filetypes = { "alpha", "dashboard", "NvimTree", "Outline" },
        ignore_focus = { "toggleterm" },
        always_divide_middle = true,
    },
    sections = {
        lualine_a = { "mode", venv },
        lualine_b = { branch, diagnostics },
        lualine_c = {},
        lualine_x = { diff, spaces, "encoding", filetype },
        lualine_y = { location },
        lualine_z = { progress },
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { "filename" },
        lualine_x = { "location" },
        lualine_y = {},
        lualine_z = {},
    },
    winbar = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { navic },
        lualine_x = {},
        lualine_y = {},
        lualine_z = {},
    },
    tabline = {},
    extensions = {},
})
