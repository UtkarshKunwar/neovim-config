local status_ok, text_case = pcall(require, "textcase")
if not status_ok then
    return
end

local status_ok_telesecope, telescope = pcall(require, "telescope")
if not status_ok_telesecope then
    return
end

text_case.setup({
    default_keymappings_enabled = false,
    substitude_command_name = "S", -- yes it is substitude in the config and not substitute
})

telescope.load_extension("textcase")
