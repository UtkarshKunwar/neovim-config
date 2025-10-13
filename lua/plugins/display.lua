local image_status_ok, image = pcall(require, "image")
if not image_status_ok then
    return
end

image.setup({
    backend = "kitty",
    processor = "magick_cli",
    integrations = {
        markdown = {
            enabled = true,
            clear_in_insert_mode = false,
            download_remote_images = true,
            only_render_image_at_cursor = false,
            only_render_image_at_cursor_mode = "popup", -- or "inline"
            floating_windows = false,
            filetypes = { "markdown", "vimwiki" }, -- markdown extensions (ie. quarto) can go here
        },
    },
})

local diagram_status_ok, diagram = pcall(require, "diagram")
if not diagram_status_ok then
    return
end

diagram.setup({
    integrations = {
        require("diagram.integrations.markdown"),
    },
    renderer_options = {
        mermaid = {
            cli_args = { "--no-sandbox" },
        },
    },
})
