local status_ok, comment = pcall(require, "Comment")
if not status_ok then
    return
end

local ctx_status_ok, ctx_comment =
    pcall(require, "ts_context_commentstring.integrations.comment_nvim")
if not ctx_status_ok then
    return
end

local todo_status_ok, todo = pcall(require, "todo-comments")
if not todo_status_ok then
    return
end

comment.setup({
    pre_hook = ctx_comment.create_pre_hook(),
})

-- Regex for highlight and search from
-- https://github.com/folke/todo-comments.nvim/issues/10#issuecomment-2446101986
todo.setup({
    highlight = {
        keyword = "bg",
        -- Highlight commented lines like KEYWORD: and KEYWORD(whatever):.
        pattern = [[.*<((KEYWORDS)%(\(.{-1,}\))?):]], -- vim regex
        comments_only = true,
    },
    search = {
        -- Search for lines like KEYWORD: and KEYWORD(whatever):.
        -- This search is code unaware.
        pattern = [[\b(KEYWORDS)(\([^\)]*\))?:]],
    },
})
