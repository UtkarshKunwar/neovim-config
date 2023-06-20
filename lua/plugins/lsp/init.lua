local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
    return
end

local signature_status_ok, lsp_signature = pcall(require, "lsp_signature")
if not signature_status_ok then
    return
end

require("plugins.lsp.mason")
require("plugins.lsp.handlers").setup()
require("plugins.lsp.null-ls")

lsp_signature.setup({
    bind = true, -- This is mandatory, otherwise border config won't get registered.
    handler_opts = {
        border = "rounded",
    },
})
