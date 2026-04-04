local status_ok, typst_preview = pcall(require, "typst-preview")
if not status_ok then
    return
end

typst_preview.setup({
    -- Custom format string to open the output link provided with %s
    -- Example: open_cmd = 'firefox %s -P typst-preview --class typst-preview'
    open_cmd = nil,

    -- Custom port to open the preview server. Default is random.
    -- Example: port = 8000
    port = 0,

    -- Custom host to bind the preview server to.
    -- Note that '0.0.0.0' is not supported and [won't be](https://github.com/Myriad-Dreamin/tinymist/issues/2105)
    -- Example: host = '192.168.0.10'
    host = "127.0.0.1",

    -- Setting this to 'always' will invert black and white in the preview
    -- Setting this to 'auto' will invert depending if the browser has enable
    -- dark mode
    -- Setting this to '{"rest": "<option>","image": "<option>"}' will apply
    -- your choice of color inversion to images and everything else
    -- separately.
    invert_colors = "never",

    -- Whether the preview will follow the cursor in the source file
    follow_cursor = true,

    -- Provide the path to binaries for dependencies.
    -- Setting this will skip the download of the binary by the plugin.
    -- Warning: Be aware that your version might be older than the one
    -- required.
    dependencies_bin = {
        tinymist = nil,
        websocat = nil,
    },
})
