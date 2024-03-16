local dap_status_ok, dap = pcall(require, "dap")
if not dap_status_ok then
    return
end

local dapui_status_ok, dapui = pcall(require, "dapui")
if not dapui_status_ok then
    return
end

local dap_python_status_ok, dap_python = pcall(require, "dap-python")
if not dap_python_status_ok then
    return
end

local virtual_text_status_ok, virtual_text =
    pcall(require, "nvim-dap-virtual-text")
if not virtual_text_status_ok then
    return
end

-- dap.adapters.cppdbg = {
--     id = "cppdbg",
--     type = "executable",
--     command = "OpenDebugAD7",
-- }
-- dap.configurations.cpp = {
--     {
--         name = "Launch file",
--         type = "cppdbg",
--         request = "launch",
--         program = function()
--             return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
--         end,
--         cwd = "${workspaceFolder}",
--         stopAtEntry = true,
--     },
--     {
--         name = "Attach to gdbserver :1234",
--         type = "cppdbg",
--         request = "launch",
--         MIMode = "gdb",
--         miDebuggerServerAddress = "localhost:1234",
--         miDebuggerPath = "gdb",
--         cwd = "${workspaceFolder}",
--         program = function()
--             return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
--         end,
--     },
-- }
-- dap.configurations.c = dap.configurations.cpp

dapui.setup()

dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
    dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
    dapui.close()
end

vim.api.nvim_set_hl(
    0,
    "DapBreakpoint",
    { ctermbg = 0, fg = "#cc3939", bg = "#31353f" }
)
vim.api.nvim_set_hl(
    0,
    "DapLogPoint",
    { ctermbg = 0, fg = "#61afef", bg = "#31353f" }
)
vim.api.nvim_set_hl(
    0,
    "DapStopped",
    { ctermbg = 0, fg = "#bbcc79", bg = "#31353f" }
)

vim.fn.sign_define("DapBreakpoint", {
    text = " ",
    texthl = "DapBreakpoint",
    linehl = "DapBreakpoint",
    numhl = "DapBreakpoint",
})
vim.fn.sign_define("DapBreakpointCondition", {
    text = "ﳁ ",
    texthl = "DapBreakpoint",
    linehl = "DapBreakpoint",
    numhl = "DapBreakpoint",
})
vim.fn.sign_define("DapBreakpointRejected", {
    text = " ",
    texthl = "DapBreakpoint",
    linehl = "DapBreakpoint",
    numhl = "DapBreakpoint",
})
vim.fn.sign_define("DapLogPoint", {
    text = " ",
    texthl = "DapLogPoint",
    linehl = "DapLogPoint",
    numhl = "DapLogPoint",
})
vim.fn.sign_define("DapStopped", {
    text = "▶ ",
    texthl = "DapStopped",
    linehl = "DapStopped",
    numhl = "DapStopped",
})

dap_python.setup("~/.virtualenvs/neovim/bin/python")
dap_python.test_runner = "pytest"

virtual_text.setup()
