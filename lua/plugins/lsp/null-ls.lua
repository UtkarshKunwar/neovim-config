local null_ls_status_ok, mason_null_ls = pcall(require, "mason-null-ls")
if not null_ls_status_ok then
    return
end

mason_null_ls.setup({
    ensure_installed = {
        -- Python
        "black",
        "isort",
        "flake8",
        "mypy",
        -- C/C++
        "clang_format",
        "cpplint",
        "cpptools",
        -- Miscellaneous
        "fixjson",
        "prettier",
        "markdownlint",
        "protolint",
        "stylua",
        "gitlint",
        "shellcheck",
        "hadolint",
        "yamllint",
        "yamlfmt",

        -- Generic
        "codespell",
    },
})
