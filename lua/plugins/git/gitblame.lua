local status_ok_gitblame, gitblame = pcall(require, "gitblame")
if not status_ok_gitblame then
    return
end

vim.api.nvim_command("highlight GitBlameHL guibg=#2f2f2f guifg=#777777")
gitblame.setup({
    message_template = "  <author> (<sha>, <date>): <summary>",
    highlight_group = "GitBlameHL",
    delay = 0,
    virtual_text_column = 60,
})
