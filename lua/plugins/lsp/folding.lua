local status_origami, origami = pcall(require, "origami")
if not status_origami then
    return
end

local status_statuscol, statuscol = pcall(require, "statuscol")
if not status_statuscol then
    return
end

origami.setup({
    useLspFoldsWithTreesitterFallback = {
        enabled = true,
        foldmethodIfNeitherIsAvailable = "syntax",
    },
    pauseFoldsOnSearch = true,
    foldtext = {
        enabled = true,
        padding = {
            character = " ",
            width = 1,
            hlgroup = nil,
        },
        lineCount = {
            template = "+%d lines", -- `%d` is replaced with the number of folded lines
            hlgroup = "FoldLineCount",
        },
        diagnosticsCount = true,
        gitsignsCount = false,
    },
    autoFold = {
        enabled = false,
        kinds = { "comment", "imports" },
    },
    foldKeymaps = {
        setup = true, -- modifies `h`, `l`, `^`, and `$`
        closeOnlyOnFirstColumn = true, -- `h` and `^` only fold in the 1st column
        scrollLeftOnCaret = false, -- `^` should scroll left (basically mapped to `0^`)
    },
})

local builtin = require("statuscol.builtin")
statuscol.setup({
    segments = {
        -- Sign column (diagnostics, git branch changes)
        { text = { "%s" } },
        -- Line numbers with a trailing space
        { text = { builtin.lnumfunc, " " } },
        -- Fold column with a trailing space (places it right next to the code)
        { text = { builtin.foldfunc, " " }, click = "v:lua.ScFa" },
    },
})
