# neovim-config

Modern Neovim setup powered by **lazy.nvim**, **LSP**, and **Treesitter**.

## 🚀 Installation

### 1. Prerequisites (Ubuntu 24.04, Non-Sudo)

Run this block to install Neovim v0.11.x and all 3rd party dependencies required
by Mason/Telescope. All binaries go to `~/.local/`.

```bash
# Prepare structure
mkdir -p ~/.local/bin ~/.local/share/fonts ~/.virtualenvs

# --- 1. Neovim (v0.11.x Release) ---
curl -LO https://github.com/neovim/neovim/releases/download/nightly/nvim-linux-x86_64.tar.gz
tar -xzf nvim-linux-x86_64.tar.gz -C ~/.local --strip-components=1
rm nvim-linux-x86_64.tar.gz

# --- 2. Rust & Cargo (via rustup) ---
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
source "$HOME/.cargo/env"

# --- 3. Node.js & NPM (via nvm) ---
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
nvm install --lts

# --- 4. Python & Pip (Virtualenv for Nvim) ---
# Matches init.lua: vim.g.python3_host_prog = "~/.virtualenvs/neovim/bin/python3"
python3 -m venv ~/.virtualenvs/neovim
~/.virtualenvs/neovim/bin/pip install pynvim flake8 mypy black isort

# --- 5. Ripgrep & FD (Binary releases) ---
# Ripgrep
curl -LO https://github.com/BurntSushi/ripgrep/releases/download/14.1.0/ripgrep-14.1.0-x86_64-unknown-linux-musl.tar.gz
tar -xzf ripgrep-14.1.0-x86_64-unknown-linux-musl.tar.gz
mv ripgrep-14.1.0-x86_64-unknown-linux-musl/rg ~/.local/bin/
rm -rf ripgrep-14.1.0-x86_64-unknown-linux-musl*

# FD
curl -LO https://github.com/sharkdp/fd/releases/download/v10.1.0/fd-v10.1.0-x86_64-unknown-linux-musl.tar.gz
tar -xzf fd-v10.1.0-x86_64-unknown-linux-musl.tar.gz
mv fd-v10.1.0-x86_64-unknown-linux-musl/fd ~/.local/bin/
rm -rf fd-v10.1.0-x86_64-unknown-linux-musl*

# --- 6. Nerd Font (FiraCode) ---
curl -LO https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/FiraCode.zip
unzip FiraCode.zip -d ~/.local/share/fonts
rm FiraCode.zip
fc-cache -fv
```

### 2. Configure Shell Path

Ensure your `~/.bashrc` or `~/.zshrc` includes these paths (as seen in your
current config):

```bash
export PATH="$HOME/.local/bin:$PATH"
source "$HOME/.cargo/env"
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
```

### 3. Clone & Launch

```bash
git clone https://github.com/UtkarshKunwar/neovim-config.git ~/.config/nvim
nvim
```

Lazy.nvim will bootstrap automatically. Run `:Mason` to verify tools.

## 🛠️ Plugins

<!-- markdownlint-disable line_length -->

| Category       | Key Plugins                                                       |
| :------------- | :---------------------------------------------------------------- |
| **Manager**    | `lazy.nvim`                                                       |
| **LSP**        | `nvim-lspconfig`, `mason.nvim`, `none-ls.nvim`                    |
| **Completion** | `nvim-cmp`, `LuaSnip`                                             |
| **Syntax**     | `nvim-treesitter`                                                 |
| **UI**         | `alpha-nvim`, `lualine.nvim`, `bufferline.nvim`, `which-key.nvim` |
| **Finder**     | `telescope.nvim`                                                  |
| **Git**        | `gitsigns.nvim`, `git-blame.nvim`                                 |
| **Utility**    | `toggleterm.nvim`, `nvim-tree.lua`, `hop.nvim`, `nvim-autopairs`  |

<!-- markdownlint-restore -->

## ⌨️ Global Keymaps (Non-Menu)

**Leader Key**: `\`

### Navigation & Windows

<!-- markdownlint-disable line_length -->

| Key                              | Action                              | Mode   |
| :------------------------------- | :---------------------------------- | :----- |
| `Left` / `Down` / `Up` / `Right` | Move to pane Left/Down/Up/Right     | Normal |
| `Ctrl+Left/Down/Up/Right`        | Move pane Left/Down/Up/Right        | Normal |
| `H` / `L`                        | Previous / Next Buffer (BufferLine) | Normal |
| `Ctrl+t`                         | New empty buffer                    | Normal |
| `Ctrl+q`                         | Close tab                           | Normal |
| `Ctrl+Tab`                       | Next Buffer                         | Normal |
| `Ctrl+Shift+Tab`                 | Previous Buffer                     | Normal |
| `+` / `-`                        | Increase / Decrease window height   | Normal |
| `<` / `>`                        | Decrease / Increase window width    | Normal |
| `=`                              | Equalize window sizes               | Normal |

<!-- markdownlint-restore -->

### Editing & Essentials

| Key               | Action                               | Mode   |
| :---------------- | :----------------------------------- | :----- |
| `;`               | Enter command mode (`:`)             | Normal |
| `0`               | Move to start of line (wrapped)      | Normal |
| `$`               | Move to end of line (wrapped)        | Normal |
| `j` / `k`         | Move down/up (wrapped lines)         | Normal |
| `U`               | Redo                                 | Normal |
| `jk` / `kj`       | Escape to Normal mode                | Insert |
| `<S-Del>`         | Backspace                            | Insert |
| `<` / `>`         | Indent/Outdent (stays in visual)     | Visual |
| `Alt+j` / `Alt+k` | Move selected lines down/up          | Visual |
| `p`               | Paste (without overwriting register) | Visual |
| `Ctrl+c`          | Yank to system clipboard             | Visual |

### Plugin Specific

| Key        | Action                          | Mode          |
| :--------- | :------------------------------ | :------------ |
| `f`        | Hop to Word                     | Normal        |
| `n` / `N`  | Next/Prev Search (with hlslens) | Normal        |
| `*` / `#`  | Search word under cursor        | Normal        |
| `Ctrl+h`   | Find hidden files (Telescope)   | Normal        |
| `Ctrl+f`   | Find files (Telescope)          | Normal        |
| `Ctrl+A-f` | Live grep (Telescope)           | Normal        |
| `\cc`      | Open Text-Case Telescope        | Normal/Visual |
| `\cr`      | Open Text-Case LSP Rename       | Normal        |
| `\Tab`     | List open buffers (Telescope)   | Normal        |

## ⌨️ WhichKey Menu (`<Space>`)

| Key | Action                                                   |
| :-- | :------------------------------------------------------- |
| `f` | Toggle File Explorer                                     |
| `h` | Clear Highlights                                         |
| `q` | Smart Quit                                               |
| `c` | Open Neovim Config                                       |
| `g` | Git Menu (Lazygit, Hunks, Blame, Telescope Git)          |
| `l` | LSP Menu (Action, Rename, Format, Diagnostics, Mason)    |
| `s` | Search Menu (Files, Grep, Help, Marks, History)          |
| `t` | Terminal Menu (Float, Horizontal, Vertical, Python, Top) |
| `p` | Preview Menu (Markdown, Typst)                           |
| `v` | Symbols Outline (Aerial)                                 |
| `z` | Zen Mode                                                 |

## 📜 Features

- **Intelligent Completion**: Snippets, LSP, Buffer, and Emoji support via
  `nvim-cmp`.
- **Syntax Highlighting**: Robust parsing for many languages via `Treesitter`.
- **Terminal**: Toggleable integrated terminals for shell, Python, and system
  monitoring.
- **Clean UI**: Modern statusline, buffer tabs, and specialized dashboard.
