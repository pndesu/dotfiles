# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Configuration Architecture

This is a Neovim configuration using lazy.nvim as the plugin manager. The configuration follows a modular structure:

- `init.lua` - Entry point that bootstraps lazy.nvim and loads configuration modules
- `lua/config/` - Core configuration modules (options, keymaps, autocmds, lazy setup)
- `lua/plugins/` - Individual plugin configurations as separate files

### Key Configuration Files

- `lua/config/lazy.lua` - Sets up lazy.nvim plugin manager, leader keys, and diagnostic configuration
- `lua/config/options.lua` - Core Neovim settings (2-space indentation, line numbers, clipboard integration)
- `lua/config/keymaps.lua` - Custom key mappings and shortcuts
- `lua/plugins/lsp.lua` - LSP configuration with Mason integration for language servers
- `lua/plugins/completion.lua` - nvim-cmp completion setup with LuaSnip snippets

### Plugin Management

Uses lazy.nvim for plugin management. Plugin specifications are stored in individual files under `lua/plugins/`. The plugin manager automatically loads all `.lua` files in the `plugins/` directory.

Lock file: `lazy-lock.json` contains exact plugin versions for reproducible builds.

## Language Server Configuration

### Supported Languages
- Lua (lua_ls) with Neovim-specific settings
- TypeScript/JavaScript (ts_ls, eslint)
- Python (pylsp) with pycodestyle, pyflakes
- Go (gopls)
- YAML (yamlls)
- Tailwind CSS (tailwindcss)
- Java (jdtls via nvim-java)
- Bash (bashls)

### LSP Keymaps
- `K` - Show hover documentation
- `gd` - Go to definition
- `gD` - Go to declaration
- `gi` - Go to implementation
- `gr` - Go to references
- `<leader>rn` - Rename symbol
- `<leader>ca` - Code actions
- `<leader>fm` - List document symbols (functions/methods/classes)

## Code Formatting

Uses conform.nvim for formatting with language-specific formatters:
- Lua: stylua
- Python: isort + black
- JavaScript/TypeScript: prettier
- HTML/CSS/JSON/Markdown: prettier

Format keybind: `<leader>g` (works in normal and visual mode)

## File Navigation and Search

Uses fzf-lua for fuzzy finding:
- `<leader>ff` - Find files
- `<leader>pf` - Find git files
- `<leader>fg` - Live grep
- `<leader>fG` - Live grep including hidden files
- `<leader>fb` - Find buffers
- `<leader>fh` - Help tags
- `<leader>fs` - Grep with input prompt

Neo-tree for file explorer:
- `<leader>e` - Toggle Neo-tree
- `<leader>o` - Focus Neo-tree

## Custom Keybindings

### Modal Keybindings
- `jk` - Exit insert mode
- `d/D/dd` - Delete without yanking (uses black hole register)
- `x/X/xx` - Cut operations (actual cut to clipboard)

### Line Movement
- `$` - Go to first non-blank character (swapped with ^)
- `^` - Go to end of line (swapped with $)
- `J/K` in visual mode - Move selected lines up/down

### Multi-cursor
- `<leader>a` - Select all instances of word under cursor (vim-visual-multi)

## Development Workflow

### Code Completion
nvim-cmp provides completion from multiple sources:
- LSP servers
- LuaSnip snippets
- Buffer text
- File paths

Completion keybinds:
- `<C-k>/<C-j>` - Navigate completion items
- `<CR>` - Accept completion
- `<C-Space>` - Manual completion trigger

### TreeSitter
Provides syntax highlighting and text objects for multiple languages including:
c, lua, vim, javascript, html, css, python, bash, json, yaml

Debug commands available:
- `<leader>ts` - Toggle TreeSitter highlighting
- `<leader>ti` - TreeSitter install info

### Git Integration
- Gitsigns for git signs in gutter
- Lazygit integration available
- Diffview for git diff visualization

## Plugin Installation

To install new language servers, add them to the `ensure_installed` list in `lua/plugins/lsp.lua` and configure the LSP setup in the same file.

For formatters, add them to `formatters_by_ft` in `lua/plugins/conform.lua`.

TreeSitter parsers are configured in `lua/plugins/treesitter.lua` in the `ensure_installed` list.