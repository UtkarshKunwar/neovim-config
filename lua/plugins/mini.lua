local status_ok, mini_move = pcall(require, "mini.move")
if not status_ok then
    return
end

mini_move.setup()
