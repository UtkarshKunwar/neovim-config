local status_ok, hop = pcall(require, "hop")
if not status_ok then
    return
end

hop.setup({
    keys = "sadfjklewcmpgh",
    teasing = false,
    case_insensitive = true,
})
