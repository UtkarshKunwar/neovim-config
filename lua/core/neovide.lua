if vim.g.neovide then
    local opts = { noremap = true, silent = true }
    -- Shorten function name
    local keymap = vim.api.nvim_set_keymap

    -- TODO: doesn't work for some reason
    keymap("c", "<D-v>", "<C-R>+", opts) -- Paste command mode
    keymap("i", "<D-v>", '<ESC>l"+Pli', opts) -- Paste insert mode

    -- Dynamic scaling of the display
    vim.g.neovide_scale_factor = 1.0
    local change_scale_factor = function(delta)
        vim.g.neovide_scale_factor = vim.g.neovide_scale_factor * delta
    end
    vim.keymap.set("n", "<C-=>", function()
        change_scale_factor(1.05)
    end)
    vim.keymap.set("n", "<C-->", function()
        change_scale_factor(1 / 1.05)
    end)

    -- Make the landing page prettier
    vim.notify("Welcome to the Neovide experience")

    local status_ok, alpha_dashboard = pcall(require, "alpha.themes.dashboard")
    if not status_ok then
        return
    end

    alpha_dashboard.section.header.val = {
        [[                                      __            ]],
        [[                               __    /\ \           ]],
        [[  ___     ___    ___   __  __ /\_\   \_\ \    ___   ]],
        [[ / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __ \  / __`\ ]],
        [[/\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \L\ \/\  __/ ]],
        [[\ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_____\ \____\]],
        [[ \/_/\/_/\/____/\/___/  \/__/    \/_/\/_____/\/____/]],
    }
end
