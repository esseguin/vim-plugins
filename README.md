# Neovim config

Personal Neovim config for TypeScript / Lua / Go / GDScript work.
Built on **Neovim 0.12** using built-in `vim.pack` (plugin manager) and
native `vim.lsp` + `vim.lsp.completion` (no coc, no nvim-cmp).

The `config/common/*.vim` files are also sourced by the **VSCode-Vim**
extension, so don't convert them to Lua.

---

## File tour

```
~/.vim/                          (== ~/.config/nvim)
├── init.vim                     entry point; sources common/, then `lua require('user')`
├── config/common/
│   ├── general.vim              shared baseline: leader=`,`, jj=Esc, ;=:, indent, mouse, etc.
│   └── keys.vim                 shared keys: clipboard yanks, j/k → gj/gk, <Space> → *N
├── lua/user/
│   ├── init.lua                 require chain — order matters
│   ├── options.lua              vim.opt.* (CLI-only)
│   ├── plugins.lua              vim.pack.add({...}) + fzf-native build hook
│   ├── lsp.lua                  vim.lsp.config + enable + LspAttach
│   ├── completion.lua           popup behavior + <CR>/<Tab>/<C-Space>
│   ├── keymaps.lua              global non-LSP keys
│   └── plugins/
│       ├── colorscheme.lua      onedark
│       ├── treesitter.lua       parsers + FileType autocmd
│       ├── mason.lua            LSP installer
│       ├── telescope.lua        fuzzy finder
│       ├── oil.lua              file explorer
│       ├── lualine.lua          statusline
│       ├── flash.lua            motion
│       └── zen-mode.lua         distraction-free mode
├── ftplugin/
│   ├── python.vim               expandtab override
│   └── ruby.vim                 expandtab override
└── syntax/
    └── splunk.vim               custom syntax (kept)
```

## Loader flow

1. `init.vim` runs always (CLI Neovim and VSCode-Vim).
2. It sources `config/common/general.vim` then `config/common/keys.vim`.
3. If `g:vscode` isn't set (= we're standalone Neovim), it does
   `lua require('user')`.
4. `lua/user/init.lua` requires options → plugins → plugin configs →
   completion → lsp → keymaps. Plugin configs come after `plugins.lua`
   because `vim.pack.add` is synchronous — by the time `plugins.lua`
   returns, every plugin is on `runtimepath` and `require()` works.

---

# Cheat sheet

Leader = `,`

## Always-on (Neovim AND VSCode-Vim)
| Key                     | Action                                  |
|-------------------------|-----------------------------------------|
| `;`                     | `:` (command mode)                      |
| `jj`                    | Esc (insert mode)                       |
| `<leader>y` / `Y` / `yy`| yank to system clipboard                |
| `j` / `k`               | move by visual line (gj/gk)             |
| `<Space>`               | search backward for word under cursor   |
| `'` / `` ` ``           | swapped (`'` jumps to line+col)         |

## Buffers / windows
| Key                | Action                              |
|--------------------|-------------------------------------|
| `<F2>` / `<left>`  | previous buffer                     |
| `<F3>` / `<right>` | next buffer                         |
| `<leader>cd`       | open terminal in current file's dir |

## LSP (any buffer with an attached server)
| Key            | Action                          |
|----------------|---------------------------------|
| `gd`           | go to definition                |
| `gy`           | go to type definition           |
| `gi`           | go to implementation            |
| `gr`           | references                      |
| `K`            | hover docs                      |
| `<leader>rn`   | rename                          |
| `<leader>ca`   | code action (visual or current) |
| `<leader>cac`  | code action on current line     |
| `<leader>qf`   | quick-fix code action           |
| `<leader>f`    | format buffer / selection       |

## Diagnostics
| Key            | Action                          |
|----------------|---------------------------------|
| `[g` / `]g`    | prev / next diagnostic          |
| `<leader>eo`   | diagnostics → location list     |
| `<leader>ec`   | close location list             |
| `<space>a`     | Telescope diagnostics           |

## Completion (insert mode)
| Key                 | Action                                   |
|---------------------|------------------------------------------|
| (auto)              | popup auto-triggers as you type          |
| `<C-Space>`         | manually trigger / refresh               |
| `<Tab>` / `<S-Tab>` | next / prev item (when popup open)       |
| `<CR>`              | accept selection (or newline if none)    |

## Telescope (fuzzy)
| Key                   | Action                          |
|-----------------------|---------------------------------|
| `<C-p>` / `<leader>p` | find files in cwd               |
| `<leader>b`           | buffer picker                   |
| `<C-t>`               | tags                            |
| `<C-l>`               | fuzzy lines in current buffer   |
| `<leader>a`           | live grep                       |
| `<space>c`            | commands                        |
| `<space>o`            | LSP document symbols            |
| `<space>s`            | LSP workspace symbols           |
| `<space>p`            | resume last picker              |

## File explorer (oil)
| Key            | Action                                |
|----------------|---------------------------------------|
| `<leader>nt`   | open oil (edit dir as buffer)         |
| `<leader>nf`   | open oil (same)                       |
| `-`            | (in oil) go up a directory            |
| `<CR>`         | (in oil) open file/dir                |
| `:w`           | (in oil) apply pending rename/delete  |

## Motion (flash)
| Key            | Action                          |
|----------------|---------------------------------|
| `s`            | flash jump                      |
| `<leader>s`    | flash jump                      |

## Commands worth remembering
| Command                    | Action                              |
|----------------------------|-------------------------------------|
| `:Goyo`                    | toggle zen mode                     |
| `:Format`                  | LSP format                          |
| `:OR`                      | organize imports (TS / Go)          |
| `:Mason`                   | install / manage LSPs               |
| `:checkhealth`             | diagnose any setup issues           |
| `:lua =vim.pack.get()`     | list installed plugins              |
| `:Git ...`                 | fugitive (status, blame, log, etc.) |
| `:GBrowse`                 | rhubarb — open file on GitHub       |
| `:InspectTree`             | show treesitter tree for buffer     |
| `:LspInfo` / `:LspLog`     | LSP status / log                    |

## Indentation defaults
- Global: 2-space, `expandtab`
- Go / GDScript: tabs (idiomatic)
- Python / Ruby: `expandtab` (per ftplugin)
- Per-project `.editorconfig` overrides everything

## When something is off
| Symptom                                  | Where to look                                   |
|------------------------------------------|-------------------------------------------------|
| no completion popup                      | `:LspInfo` — server attached?                   |
| GDScript LSP says ECONNREFUSED           | open Godot first; LSP is on TCP 6005            |
| TS file looks like plain text            | treesitter parser missing — `:checkhealth`      |
| Telescope-fzf-native missing             | `cd ~/.local/share/nvim/site/pack/.../telescope-fzf-native.nvim && make` |
| treesitter "no such file: tree-sitter"   | `brew install tree-sitter-cli` (NOT `tree-sitter` — that's just the lib), then relaunch |
| weird key behavior                       | `:verbose imap <key>` to see who mapped it      |
