local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
    return
end

local lsp_signature_status_ok, lsp_signature = pcall(require, "lsp_signature")
if not lsp_signature_status_ok then
    return
end

lsp_signature.setup({
    hint_prefix = " ",
})

require("plugins.lsp.mason")
require("plugins.lsp.handlers").setup()
require("plugins.lsp.null-ls")
