local servers = {
    "awk_ls", -- awk
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
    "marksman", -- MarkDown
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
    }
}

require("mason").setup(settings)
require("mason-lspconfig").setup({
    ensure_installed = servers,
    automatic_installation = true,
})

local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
    return
end

local opts = {}

for _, server in pairs(servers) do
    opts = {
        on_attach = require("plugins.lsp.handlers").on_attach,
        capabilities = require("plugins.lsp.handlers").capabilities,
    }

    server = vim.split(server, "@")[1]

    local require_ok, conf_opts = pcall(require, "plugins.lsp.settings." .. server)
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
                        [vim.fn.expand "$VIMRUNTIME/lua"] = true,
                        [vim.fn.stdpath "config" .. "/lua"] = true,
                    }
                },
                format = {
                    enable = false,
                }
            }
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
