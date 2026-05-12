local status_ok, leetcode = pcall(require, "leetcode")
if not status_ok then
    return
end

leetcode.setup({
    -- configuration goes here
    injector = {
        ["cpp"] = {
            imports = function()
                return {
                    "#include <algorithm>",
                    "#include <array>",
                    "#include <climits>",
                    "#include <cmath>",
                    "#include <cstddef>",
                    "#include <cstdint>",
                    "#include <deque>",
                    "#include <iostream>",
                    "#include <list>",
                    "#include <map>",
                    "#include <numeric>",
                    "#include <queue>",
                    "#include <set>",
                    "#include <stack>",
                    "#include <string>",
                    "#include <unordered_map>",
                    "#include <unordered_set>",
                    "#include <vector>",
                    "using namespace std;",
                }
            end,
        },
    },
    editor = { reset_previous_code = false },
    picker = { provider = "telescope" },
    image_support = not vim.g.neovide,
})
