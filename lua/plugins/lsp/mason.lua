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

local lspconfig_util_status_ok, lspconfig_util =
    pcall(require, "lspconfig.util")
if not lspconfig_util_status_ok then
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
    "ts_ls", -- TypeScript
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

    if server == "tblgen_lsp_server" then
        opts["cmd"] = {
            "tblgen-lsp-server",
            "--tablegen-compilation-database=build/tablegen_compile_commands.yml",
        }
        -- patterns extended from clangd
        opts["root_dir"] = lspconfig_util.root_pattern(
            "tablegen_compile_commands.yml",
            ".clangd",
            ".clang-tidy",
            ".clang-format",
            "compile_commands.json",
            "compile_flags.txt",
            "configure.ac",
            ".git"
        )
    end

    if server == "mlir_pdll_lsp_server" then
        opts["cmd"] = {
            "mlir-pdll-lsp-server",
            "--pdll-compilation-database=build/pdll_compile_commands.yml",
        }
        -- patterns extended from clangd
        opts["root_dir"] = lspconfig_util.root_pattern(
            "pdll_compile_commands.yml",
            ".clangd",
            ".clang-tidy",
            ".clang-format",
            "compile_commands.json",
            "compile_flags.txt",
            "configure.ac",
            ".git"
        )
    end

    lspconfig[server].setup(opts)
end

-- Extra logic to install plugins for mdformat in its environment because Mason does not
-- support it. See https://github.com/mason-org/mason-registry/pull/3900.
local registry_status_ok, mason_registry = pcall(require, "mason-registry")
if not registry_status_ok then
    return
end

mason_registry.refresh(function()
    local mdformat = mason_registry.get_package("mdformat")
    local mdformat_extensions = {
        "mdformat-obsidian[recommended]",
        "mdformat-beautysh",
        "mdformat-black",
        "mdformat-gfm",
        "mdformat-tables",
        "mdformat-toc",
        "linkify-it-py",
    }
    mdformat:on("install:success", function()
        -- Create the installation command.
        vim.notify("Installing mdformat extensions.")
        local extensions = table.concat(mdformat_extensions, " ")
        local python = mdformat:get_install_path() .. "/venv/bin/python"
        local pip_cmd =
            string.format("%s -m pip install %s", python, extensions)

        -- vim.fn.jobstart doesn't work in callback so use popen instead.
        local handle = io.popen(pip_cmd)
        if not handle then
            vim.notify(
                'Could not install "mdformat extensions".',
                vim.log.levels.ERROR
            )
            return
        end
        local _ = handle:read("*a")
        handle:close()

        vim.notify('"mdformat extensions" were successfully installed.')
    end)
end)
