local status_ok, leetcode = pcall(require, "leetcode")
if not status_ok then
    return
end

local leet_mappings = {
    ["1"] = {
        name = "LeetCode",
        ["\\"] = { "<cmd>Leet console<cr>", "Open Console" },
        b = { "<cmd>Leet tabs<cr>", "List Open Tabs" },
        c = { "<cmd>Leet console<cr>", "Open Console" },
        h = { "<cmd>Leet hints<cr>", "Show Hints" },
        i = { "<cmd>Leet inject<cr>", "Inject Headers" },
        l = { "<cmd>Leet list<cr>", "List Problems" },
        r = {
            "<cmd>Leet reset<cr>",
            "Reset Original Boilerplate",
        },
        s = { "<cmd>Leet submit<cr>", "Submit Solution" },
        t = { "<cmd>Leet test<cr>", "Test Solution" },
    },
}

leetcode.setup({
    -- configuration goes here
    hooks = {
        ---@type fun()[]
        ["enter"] = {
            function()
                local status, wk = pcall(require, "plugins.whichkey")
                if not status then
                    return
                end
                wk.which_key.register(leet_mappings, wk.opts)
            end,
        },

        ---@diagnostic disable-next-line: undefined-doc-name
        ---@type fun(question: lc.ui.Question)[]
        ["question_enter"] = {},

        ---@type fun()[]
        ["leave"] = {
            function()
                local status, wk = pcall(require, "plugins.whichkey")
                if not status then
                    return
                end

                for key, _ in pairs(leet_mappings["1"]) do
                    -- pcall prevents errors if a key wasn't mapped
                    if not key == "name" then
                        pcall(vim.keymap.del, "n", wk.opts.prefix .. "1" .. key)
                    end
                end
            end,
        },
    },
    injector = {
        ["cpp"] = {
            imports = function()
                return {
                    "",
                    "#include <algorithm>",
                    "#include <array>",
                    "#include <climits>",
                    "#include <cmath>",
                    "#include <cstddef>",
                    "#include <cstdint>",
                    "#include <deque>",
                    "#include <functional>",
                    "#include <iostream>",
                    "#include <list>",
                    "#include <map>",
                    "#include <numeric>",
                    "#include <queue>",
                    "#include <set>",
                    "#include <sstream>",
                    "#include <stack>",
                    "#include <string>",
                    "#include <string_view>",
                    "#include <tuple>",
                    "#include <unordered_map>",
                    "#include <unordered_set>",
                    "#include <utility>",
                    "#include <vector>",
                    "",
                    "using namespace std;",
                    "",
                }
            end,
        },
    },
    editor = { reset_previous_code = false, fold_imports = false },
    picker = { provider = "telescope" },
    image_support = not vim.g.neovide,
})
