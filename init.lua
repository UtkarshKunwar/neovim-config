vim.g.python3_host_prog = "~/.virtualenvs/neovim/bin/python3"

require("packer_init")
require("core.autocommands")
require("core.options")
require("core.keymaps")
require("core.colourscheme")
require("plugins.aerial")
require("plugins.alpha")
require("plugins.autopairs")
require("plugins.bufferline")
require("plugins.colorizer")
require("plugins.comment")
require("plugins.completion")
require("plugins.confirm-quit")
require("plugins.debugger")
require("plugins.dressing")
require("plugins.doge")
require("plugins.git")
require("plugins.motion")
require("plugins.impatient")
require("plugins.indentline")
require("plugins.lsp")
require("plugins.lualine")
require("plugins.markdown-preview")
require("plugins.notify")
require("plugins.nvim-tree")
require("plugins.project")
require("plugins.scrollbar")
require("plugins.surround")
require("plugins.telescope")
require("plugins.toggleterm")
require("plugins.treesitter")
require("plugins.virtualenv")
require("plugins.whichkey")
require("core.neovide")
