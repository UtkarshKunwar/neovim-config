local status_ok, llm = pcall(require, "gen")
if not status_ok then
    return
end

llm.setup({
    model = "coder_small", -- The default model to use.
    host = "localhost", -- The host running the Ollama service.
    port = "11434", -- The port on which the Ollama service is listening.
    display_mode = "split", -- The display mode. Can be "float" or "split".
    show_prompt = true, -- Shows the Prompt submitted to Ollama.
    show_model = true, -- Displays which model you are using at the beginning of your chat session.
    quit_map = "q", -- set keymap for quit.
    no_auto_close = false, -- Never closes the window automatically.
    init = function(_) -- options
        -- pcall(io.popen, "ollama serve > /dev/null 2>&1 &")
    end,
    -- Function to initialize Ollama
    command = function(options)
        return "curl --silent --no-buffer -X POST http://"
            .. options.host
            .. ":"
            .. options.port
            .. "/api/chat -d $body"
    end,
    -- The command for the Ollama service. You can use placeholders $prompt, $model and $body (shellescaped).
    -- This can also be a lua function returning a command string, with options as the input parameter.
    -- The executed command must return a JSON object with { response, context }
    -- (context property is optional).
    debug = false, -- Prints errors and the command which is run.
})
