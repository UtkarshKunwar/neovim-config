-- Define a custom function to run instead of :q
function SmartQuit()
    print("") -- empty to clear command line
    local n_listed_buffers = #vim.fn.getbufinfo({ buflisted = true })
    local is_current_buffer_hidden = not vim.bo[0].buflisted

    if is_current_buffer_hidden then
        vim.cmd("q")
    elseif n_listed_buffers > 1 then
        vim.cmd("BufDel")
    else
        -- Prompt the user for input
        vim.ui.select({ "Yes", "No" }, { prompt = "Do you really want to quit?" }, function(selected)
            if selected == "Yes" then
                vim.cmd("q!")
            end
        end)
    end
end

-- Create an autocmd that intercepts :q and calls the custom function
vim.cmd([[ cnoreabbrev <expr> q (getcmdtype() == ":" && getcmdline() ==# "q") ? "lua SmartQuit()" : "q" ]])
vim.cmd([[ cnoreabbrev qq quit ]])
