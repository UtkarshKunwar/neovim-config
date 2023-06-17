vim.g.python3_host_prog = "~/.virtualenvs/neovim/bin/python3"

require("packer_init")
require("core.autocommands")
require("core.options")
require("core.keymaps")
-- require("core.colourscheme")
require("core.colourscheme_vscode")
require("plugins.completion")
require("plugins.lsp")
require("plugins.telescope")
require("plugins.treesitter")
require("plugins.hop")
require("plugins.doge")
require("plugins.autopairs")
require("plugins.surround")
require("plugins.comment")
require("plugins.gitsigns")
require("plugins.nvim-tree")
require("plugins.bufferline")
require("plugins.lualine")
require("plugins.toggleterm")
require("plugins.project")
require("plugins.impatient")
require("plugins.indentline")
require("plugins.alpha")
require("plugins.whichkey")
require("plugins.windows")
