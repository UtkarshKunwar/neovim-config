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
local actions = null_ls.builtins.code_actions
local completion = null_ls.builtins.completion

null_ls.setup({
    sources = {
        -- Python
        diagnostics.flake8,
        diagnostics.mypy,
        formatting.black,
        formatting.isort,

        -- C/C++
        formatting.clang_format,

        -- Miscellaneous
        actions.gitsigns,
        actions.shellcheck,

        completion.luasnip,

        diagnostics.codespell,
        diagnostics.gitlint,
        diagnostics.hadolint,
        diagnostics.markdownlint,
        diagnostics.protolint,
        diagnostics.shellcheck,
        diagnostics.yamllint,

        formatting.fixjson,
        formatting.markdownlint,
        formatting.prettier,
        formatting.protolint,
        formatting.stylua,
        formatting.yamlfmt,
    },
})

mason_null_ls.setup({
    ensure_installed = nil,
    automatic_installation = true,
})
