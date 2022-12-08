local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
    return
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup({
    debug = false,
    sources = {
        -- Python
        formatting.black,
        formatting.isort,
        diagnostics.flake8,
        diagnostics.mypy,
        -- C/C++
        formatting.cmake_format,
        diagnostics.cmake_lint,

        formatting.clang_format,
        diagnostics.cppcheck,
        -- Markdown
        formatting.markdown_toc,
        -- Miscellaneous
        formatting.fixjson,
        diagnostics.jsonlint,

        formatting.prettier.with({ extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" } }),

        formatting.trim_newlines,
        formatting.trim_whitespace,
        diagnostics.trail_space,
        -- Generic
        formatting.codespell,
        diagnostics.codespell,

        diagnostics.commitlint,
        diagnostics.shellcheck,
        diagnostics.todo_comments,
        diagnostics.zsh,
    },
})
