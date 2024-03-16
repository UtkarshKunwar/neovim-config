local status_ok, mason = pcall(require, "mason")
if not status_ok then
    return
end

local mason_lsp_config_status_ok, mason_lspconfig =
    pcall(require, "mason-lspconfig")
if not mason_lsp_config_status_ok then
    return
end

local installer_status_ok, mason_installer =
    pcall(require, "mason-tool-installer")
if not installer_status_ok then
    return
end

local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
    return
end

local servers = {
    "bashls", -- bash
    "cmake", -- cmake
    "clangd", -- C/C++
    "dockerls", -- docker
    -- "groovyls", -- Jenkins
    "taplo", -- ToML
    "vimls", -- Vim
    "html", -- HTML
    "jsonls", -- JSON
    "pyright", -- Python
    "rust_analyzer", -- Rust
    "lua_ls", -- Lua
    "tsserver", -- TypeScript
    "yamlls", -- YAML
    "marksman", -- Markdown
}

local settings = {
    ui = {
        border = "none",
        icons = {
            package_installed = "◍",
            package_pending = "◍",
            package_uninstalled = "◍",
        },
    },
    log_level = vim.log.levels.INFO,
    max_concurrent_installers = 4,
    providers = {
        "mason.providers.registry-api",
    },
}

mason.setup(settings)
mason_lspconfig.setup({
    ensure_installed = servers,
    automatic_installation = true,
})

local non_lsp_servers = {
    "debugpy", -- Python
    "cpptools", -- C/C++
    "flake8", -- Python
}

local mason_servers = require("utils").list.concat(servers, non_lsp_servers)

mason_installer.setup({
    ensure_installed = mason_servers,
    start_delay = 3000, -- 3 seconds
})

local opts = {}

local non_mason_servers = {
    "mlir_lsp_server",
    "mlir_pdll_lsp_server",
    "tblgen_lsp_server",
}
local lsp_servers = require("utils").list.concat(servers, non_mason_servers)

for _, server in pairs(lsp_servers) do
    opts = {
        on_attach = require("plugins.lsp.handlers").on_attach,
        capabilities = require("plugins.lsp.handlers").capabilities,
    }

    server = vim.split(server, "@")[1]

    local require_ok, conf_opts =
        pcall(require, "plugins.lsp.settings." .. server)
    if require_ok then
        opts = vim.tbl_deep_extend("force", conf_opts, opts)
    end

    if server == "lua_ls" then
        local lua_settings = {
            Lua = {
                diagnostics = {
                    globals = { "vim" },
                },
                workspace = {
                    library = {
                        [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                        [vim.fn.stdpath("config") .. "/lua"] = true,
                    },
                },
                format = {
                    enable = false,
                },
            },
        }
        opts["settings"] = lua_settings
    end

    if server == "clangd" then
        opts["cmd"] = {
            "clangd",
            "--offset-encoding=utf-16",
        }
    end

    lspconfig[server].setup(opts)
end
