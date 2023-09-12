local status_ok_gitblame, gitblame = pcall(require, "gitblame")
if not status_ok_gitblame then
    return
end

-- if entering visual mode, change highlight by making it dimmer. Else in normal mode,
-- where the cursorline gets rendered, make it to match the highlight of the cursorline.
vim.api.nvim_command("highlight gitblame_normal guibg=#2f2f2f guifg=#777777")
vim.api.nvim_command("highlight gitblame_visual guibg=#1e1e1e guifg=#666666")
vim.cmd([[
  augroup VisualEvent
    autocmd!
    autocmd ModeChanged *:[vV\x16]* highlight! link gitblame gitblame_visual
    autocmd Modechanged [vV\x16]*:* highlight! link gitblame gitblame_normal
  augroup END
]])

gitblame.setup({
    message_template = "  <author> (<sha>, <date>): <summary>",
    highlight_group = "gitblame_normal",
    date_format = "%b%d'%y %H:%M",
    delay = 0,
    virtual_text_column = 60,
})
