local opts = { noremap = true, silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
vim.g.mapleader = "\\"
vim.g.maplocalleader = "\\"

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- For LSP related keymaps, check the lua/plugins/lsp/handlers.lua

-- Normal --
-- Better window navigation
keymap("n", "<Left>", "<C-w>h", opts)
keymap("n", "<Down>", "<C-w>j", opts)
keymap("n", "<Up>", "<C-w>k", opts)
keymap("n", "<Right>", "<C-w>l", opts)
keymap("n", "<C-Left>", "<C-w>H", opts)
keymap("n", "<C-Down>", "<C-w>J", opts)
keymap("n", "<C-Up>", "<C-w>K", opts)
keymap("n", "<C-Right>", "<C-w>L", opts)

-- "Tabs" --
keymap("n", "<C-t>", ":enew<CR>", opts)
keymap("n", "H", ":bprev<CR>", opts)
keymap("n", "L", ":bnext<CR>", opts)
keymap("n", "<Space>q", ":BufDel<CR>", opts)

-- Navigation that just makes sense to me --
keymap("n", ";", ":", opts)
keymap("n", "0", "g0", opts)
keymap("n", "$", "g$", opts)
keymap("n", "U", "<C-r>", opts)

-- Resize with arrows
keymap("n", "+", "<C-w>+", opts)
keymap("n", "-", "<C-w>-", opts)
keymap("n", "<", "<C-w><", opts)
keymap("n", ">", "<C-w>>", opts)
keymap("n", "=", "<C-w>=", opts)

-- Navigate buffers
keymap("n", "<C-Tab>", ":bnext<CR>", opts)
keymap("n", "<C-S-Tab>", ":bprevious<CR>", opts)

vim.opt.wildcharm = ("\t"):byte()
keymap(
    "n",
    "<Leader><Tab>",
    "<cmd>lua require'telescope.builtin'.buffers(require('telescope.themes').get_dropdown{previewer = false})<CR>",
    opts
)

-- Insert --
-- Press jk fast to enter
keymap("i", "jk", "<ESC>", opts)
keymap("i", "kj", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Terminal --
-- Check the config in lua/plugins/toggleterm.lua

-- Plugins --
-- Telescope --
keymap("n", "<C-h>", "<cmd>lua require'telescope.builtin'.find_files({hidden=true})<CR>", opts)
keymap("n", "<C-f>", "<cmd>lua require'telescope.builtin'.find_files()<CR>", opts)
keymap("n", "<C-A-f>", "<cmd>lua require'telescope.builtin'.live_grep()<CR>", opts)
keymap("n", "<C-P>", "<cmd>lua require'telescope'.extensions.projects.projects()<CR>", opts)

-- NVIM-Tree --
-- See lua/plugins/whichkey.lua

-- GitSigns --
-- See lua/plugins/whichkey.lua

-- Hop.NVIM
keymap("n", "f", "<cmd>HopWord<CR>", opts)

-- nvim-hlslens
keymap("n", "n", [[<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>]], opts)
keymap("n", "N", [[<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>]], opts)
keymap("n", "*", [[*<Cmd>lua require('hlslens').start()<CR>]], opts)
keymap("n", "#", [[#<Cmd>lua require('hlslens').start()<CR>]], opts)
keymap("n", "g*", [[g*<Cmd>lua require('hlslens').start()<CR>]], opts)
keymap("n", "g#", [[g#<Cmd>lua require('hlslens').start()<CR>]], opts)
