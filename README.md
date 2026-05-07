# Neovim config

Built on **Neovim 0.12** using built-in `vim.pack` (plugin manager) and
native `vim.lsp` + `vim.lsp.completion` (no coc, no nvim-cmp).

> Coming back after time away? Work through [LEARNING.md](./LEARNING.md) once,
> then keep this file open as a reference.

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
│       ├── zen-mode.lua         distraction-free mode
│       ├── which-key.lua        prefix-key popup (cheat sheet for muscle memory)
│       ├── gitsigns.lua         in-buffer git markers + hunk ops
│       ├── surround.lua         add / change / delete surround chars (gs prefix)
│       ├── treesitter-textobjects.lua  function/class/parameter text objects
│       ├── conform.lua          formatter dispatcher (prettier/stylua/goimports)
│       └── trouble.lua          diagnostics / refs / qflist panel
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

> Tip: press a prefix (`<leader>`, `g`, `]`, `[`) and pause — **which-key** pops up a live cheat sheet of what's available. Faster than this README once you're back in flow.

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
| Key               | Action                              |
|-------------------|-------------------------------------|
| `]b` / `[b`       | next / previous buffer              |
| `<C-^>`           | toggle to alternate (last) buffer   |
| `<C-o>` / `<C-i>` | jumplist back / forward             |
| `<leader>cd`      | open terminal in current file's dir |

## LSP (any buffer with an attached server)
Most LSP keys are Neovim 0.11 **defaults** — listed here so you remember they exist.
| Key              | Action                    | Source        |
|------------------|---------------------------|---------------|
| `gd`             | go to definition          | this config   |
| `K`              | hover docs                | nvim default  |
| `grn`            | rename                    | nvim default  |
| `gra`            | code action               | nvim default  |
| `grr`            | references                | nvim default  |
| `gri`            | implementation            | nvim default  |
| `grt`            | type definition           | nvim default  |
| `gO`             | document symbols          | nvim default  |
| `<C-s>` (insert) | signature help            | nvim default  |
| `<leader>cf`     | format buffer / selection | this config   |
| `<leader>cq`     | quick-fix code action     | this config   |

## Diagnostics
| Key            | Action                       | Source        |
|----------------|------------------------------|---------------|
| `]d` / `[d`    | next / prev diagnostic       | nvim default  |
| `<leader>fd`   | Telescope diagnostics list   | this config   |

## Completion (insert mode)
| Key                 | Action                                   |
|---------------------|------------------------------------------|
| (auto)              | popup auto-triggers as you type          |
| `<C-Space>`         | manually trigger / refresh               |
| `<Tab>` / `<S-Tab>` | next / prev item (when popup open)       |
| `<CR>`              | accept selection (or newline if none)    |

## Telescope (`<leader>f...` namespace)
| Key                    | Action                  |
|------------------------|-------------------------|
| `<C-p>` / `<leader>ff` | find files in cwd       |
| `<leader>fg`           | live grep               |
| `<leader>fb`           | buffers                 |
| `<leader>fh`           | help tags               |
| `<leader>fr`           | resume last picker      |
| `<leader>fc`           | commands                |
| `<leader>fd`           | diagnostics             |
| `<leader>fs`           | LSP workspace symbols   |
| `<leader>fo`           | LSP document symbols    |

## File explorer (oil)
| Key            | Action                                |
|----------------|---------------------------------------|
| `<leader>e`    | open oil (edit dir as buffer)         |
| `-`            | (in oil) go up a directory            |
| `<CR>`         | (in oil) open file/dir                |
| `:w`           | (in oil) apply pending rename/delete  |

## Motion (flash)
| Key  | Action      |
|------|-------------|
| `s`  | flash jump  |

## Text objects (treesitter-aware)
Combine with `d` / `y` / `c` / `v`. e.g. `daf` deletes a function, `vic` selects inside class.
| Key       | Object                       |
|-----------|------------------------------|
| `af` / `if` | around / inside function   |
| `ac` / `ic` | around / inside class      |
| `aa` / `ia` | around / inside parameter  |
| `]f` / `[f` | next / prev function start |
| `]F` / `[F` | next / prev function end   |

## Surround (`gs` prefix)
| Key                       | Action                                    | Example |
|---------------------------|-------------------------------------------|---------|
| `gsa{motion}{char}`       | add surround                              | `gsaiw"` → `"foo"` |
| `gsr{old}{new}`           | replace surround                          | `gsr"'`  → `'foo'` |
| `gsd{char}`               | delete surround                           | `gsd"`   → `foo`   |
| `gsf{char}` / `gsF{char}` | find surround right / left                |         |
| `gsh{motion}`             | highlight surround                        |         |

## Comments (Neovim 0.10+ built-in, no plugin)
| Key       | Action                          |
|-----------|---------------------------------|
| `gcc`     | toggle comment on current line  |
| `gc{motion}` | toggle comment over motion   |
| `gc` (visual) | toggle comment on selection |

## Diagnostics / lists (`<leader>x...` namespace, trouble.nvim)
| Key            | Action                          |
|----------------|---------------------------------|
| `<leader>xx`   | workspace diagnostics panel     |
| `<leader>xX`   | buffer-only diagnostics panel   |
| `<leader>xs`   | symbols panel                   |
| `<leader>xl`   | LSP refs/def/impl panel         |
| `<leader>xL`   | location list                   |
| `<leader>xQ`   | quickfix list                   |

## Git (`<leader>g...` namespace)
| Key            | Action                                  | Provided by |
|----------------|-----------------------------------------|-------------|
| `<leader>gg`   | open lazygit (interactive TUI)          | lazygit     |
| `<leader>gb`   | blame current file                      | fugitive    |
| `<leader>gB`   | blame current line (full, with hover)   | gitsigns    |
| `<leader>gh`   | stage hunk                              | gitsigns    |
| `<leader>gr`   | reset hunk                              | gitsigns    |
| `<leader>gp`   | preview hunk                            | gitsigns    |
| `<leader>gd`   | diff this file                          | gitsigns    |
| `]h` / `[h`    | next / prev hunk                        | gitsigns    |
| `:Git ...`     | any other fugitive command              | fugitive    |
| `:GBrowse`     | open file on GitHub                     | rhubarb     |

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

## Future plugins to consider

Things I've decided to skip for now but might want later. Listed so I don't have
to re-research what the modern community uses.

| Plugin                | What it does                                              | When I'd add it |
|-----------------------|-----------------------------------------------------------|-----------------|
| `nvim-autopairs`      | auto-close `({[` and quotes                               | if manual closing gets annoying |
| `bufferline.nvim`     | VSCode-style buffer tabs at top of window                 | if I lose track of open buffers |
| `indent-blankline`    | vertical indent guide lines                               | for deeply nested code |
| `nvim-colorizer.lua`  | inline color swatches for `#abc123` etc.                  | doing CSS / theming work |
| `harpoon.nvim`        | pin 4 files for instant 1-key jump                        | jumping between same 3-4 files all day |
| `nvim-lint`           | linter dispatcher (ruff, stylelint, etc.)                 | linters not covered by an LSP |
| `mason-tool-installer`| declarative install for non-LSP tools (prettier, etc.)    | if `:MasonInstall` becomes tedious |
| `toggleterm.nvim`     | floating / split terminals on a hotkey                    | if the lazygit-tab pattern gets old |
| `markdown-preview.nvim` | live markdown preview in browser                        | writing long docs |
| `nvim-notify`         | pretty toast notifications                                | mostly cosmetic |
| `dressing.nvim`       | nicer floating UI for `vim.ui.input` / `select`           | mostly cosmetic |
| `mini.ai`             | extended a/i text objects (any bracket, func calls, etc.) | if treesitter-textobjects feels limiting |
| `mini.move`           | move lines / selections with alt+hjkl                     | personal taste |
| `neogit`              | magit-style git TUI inside nvim                           | if lazygit doesn't stick |
| `diffview.nvim`       | side-by-side diff browser, integrates with neogit         | reviewing big PRs locally |
| `auto-session`        | restore window layout per directory                       | switching between many projects |

Skipping intentionally: **noice.nvim** (pretty cmdline but masks errors),
**snacks.nvim / mini.nvim full bundle** (too much in one go — cherry-pick instead),
**leap.nvim** (alternative to flash, no need), **dashboard plugins** (cosmetic).

## When something is off
| Symptom                                  | Where to look                                   |
|------------------------------------------|-------------------------------------------------|
| no completion popup                      | `:LspInfo` — server attached?                   |
| GDScript LSP says ECONNREFUSED           | open Godot first; LSP is on TCP 6005            |
| TS file looks like plain text            | treesitter parser missing — `:checkhealth`      |
| Telescope-fzf-native missing             | `cd ~/.local/share/nvim/site/pack/.../telescope-fzf-native.nvim && make` |
| treesitter "no such file: tree-sitter"   | `brew install tree-sitter-cli` (NOT `tree-sitter` — that's just the lib), then relaunch |
| weird key behavior                       | `:verbose imap <key>` to see who mapped it      |
