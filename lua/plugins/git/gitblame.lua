local status_ok_gitblame, gitblame = pcall(require, "gitblame")
if not status_ok_gitblame then
    return
end

gitblame.setup({
    message_template = "  <author> (<sha>, <date>): <summary>",
    date_format = "%y/%m/%d %H:%M",
    delay = 0,
    virtual_text_column = vim.o.textwidth + 1,
})
