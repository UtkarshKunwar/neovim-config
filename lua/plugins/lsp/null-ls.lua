require("plugins.lsp.mason")

local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
    return
end

local mason_null_ls_status_ok, mason_null_ls = pcall(require, "mason-null-ls")
if not mason_null_ls_status_ok then
    return
end

local diagnostics = null_ls.builtins.diagnostics
local formatting = null_ls.builtins.formatting

null_ls.setup({
    sources = {
        -- Python
        diagnostics.mypy,
        formatting.black,
        formatting.isort,
        require("none-ls.diagnostics.flake8"),
        -- require("none-ls.diagnostics.ruff"), -- Replace above with ruff when mature

        -- C/C++
        formatting.clang_format.with({
            filetypes = {
                "c",
                "cpp",
                "cs",
                "java",
                "cuda",
                "proto",
                "tablegen",
            },
        }),

        -- Miscellaneous
        diagnostics.codespell,
        diagnostics.gitlint,
        diagnostics.hadolint,
        diagnostics.markdownlint,
        diagnostics.protolint,
        diagnostics.yamllint.with({
            extra_args = {
                "-d",
                "{extends: default, rules: {document-start: disable, comments: disable}}",
            },
        }),
        require("none-ls-shellcheck.diagnostics"), -- Legacy
        require("none-ls-shellcheck.code_actions"), -- Legacy
        diagnostics.selene,
        formatting.mdformat.with({ extra_args = { "--wrap", "80" } }),
        formatting.prettier,
        formatting.protolint,
        formatting.stylua,
        formatting.yamlfmt,
        formatting.shfmt,
    },
    on_attach = function(_, bufnr)
        vim.api.nvim_set_option_value("formatexpr", "", { buf = bufnr })
    end,
})

mason_null_ls.setup({
    ensure_installed = nil,
    automatic_installation = true,
})
