local status_ok_gitblame, gitblame = pcall(require, "gitblame")
if not status_ok_gitblame then
    return
end

gitblame.setup({
    message_template = "  <author> (<date>): <summary>",
    date_format = "%b%d'%y %H:%M",
    delay = 0,
    virtual_text_column = 91,
})
