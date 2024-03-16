local status_ok, comment = pcall(require, "Comment")
if not status_ok then
    return
end

local ctx_status_ok, ctx_comment =
    pcall(require, "ts_context_commentstring.integrations.comment_nvim")
if not ctx_status_ok then
    return
end

comment.setup({
    pre_hook = ctx_comment.create_pre_hook(),
})
