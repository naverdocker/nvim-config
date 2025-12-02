# Neovim Configuration

A lightweight, modular, and "hand-rolled" configuration for **Neovim** (with legacy support for **Vim**).

This configuration prioritizes speed and standard functionality over heavy plugin usage. It features a robust **Tmux integration** workflow, making it ideal for developers who live in the terminal.

## ⚡ Features

*   **Modular Lua Structure:** Clean separation of concerns (`settings`, `keymaps`, `autocmds`, `highlights`).
*   **Tmux Integration:** Execute files or code snippets in adjacent Tmux panes directly from the editor.
*   **Legacy Support:** Includes a `.vimrc` that mirrors core functionality for environments where Neovim isn't available.
*   **Minimal Dependencies:** Focuses on built-in features, avoiding heavy plugin managers by default.
*   **WSL Compatibility:** Includes `xclip-wsl` configuration for system clipboard support in Windows Subsystem for Linux.

## 📂 Structure

```text
~/.config/nvim/
├── init.lua             # Entry point (Lua)
├── vimrc                # Legacy entry point (VimScript)
├── lua/
│   ├── settings.lua     # Options (tabstop, numbers, splits)
│   ├── keymaps.lua      # Custom keybindings & Tmux logic
│   ├── autocmds.lua     # Event handlers (save view, highlight yank)
│   ├── highlights.lua   # Custom UI overrides
│   └── themes/          # Theme management
```

## 🚀 Installation

1.  **Backup existing config:**
    (Standard Linux path shown below. Adjust if your config is located elsewhere.)
    ```bash
    mv ~/.config/nvim ~/.config/nvim.bak
    ```

2.  **Clone the repository:**
    ```bash
    git clone https://github.com/naverdocker/nvim-config.git ~/.config/nvim
    ```

## ⌨️ Keymaps

**Leader Key:** `,` (Comma)

### Core Editing
| Key | Action |
| :--- | :--- |
| `<leader>w` | Save file |
| `<leader>wa` | Save all |
| `<leader>wqa` | Save all and quit |
| `<leader>e` | Open Netrw (File Explorer) |
| `<leader>sp` | Toggle Spell Check |
| `<leader>3` | Toggle Comment (Line) |

### View & Navigation
| Key | Action |
| :--- | :--- |
| `<C-h/j/k/l>` | Navigate Splits (Window) |
| `<leader>h` | Toggle Search Highlight |
| `<leader>re` | Toggle Relative Numbers |
| `<leader>dt` | Insert Date/Time Timestamp |

### 🖥️ Tmux Integration
*Requires `tmux` to be running.*

| Key | Action | Target Pane |
| :--- | :--- | :--- |
| `<leader>ww` | **Execute** current file | **Bottom** |
| `<leader>wr` | **Execute** current file | **Right** |
| `<leader>wc` | Clear screen (`clear`) | **Bottom** |
| `<leader>rc` | Clear screen (`clear`) | **Right** |
| `<leader>vv` | **Execute** current line | **Bottom** |
| `<leader>rr` | **Execute** current line | **Right** |
| `<leader>v` (Visual) | **Execute** selection | **Bottom** |
| `<leader>r` (Visual) | **Execute** selection | **Right** |

## 🎨 Themes
Currently defaults to **Wildcharm**. Can be changed in `lua/themes/init.lua`.

## 📋 Requirements
*   **Neovim** (>= 0.8.0 recommended)
*   **Tmux** (for integration features)
*   **xclip** (for system clipboard support)

## 📄 License
MIT
