# Learning path

A structured way to internalize the new setup. Each lesson is 5-15 minutes
of *doing* — open a real file and run the drill. Order matters: later
lessons assume the muscle memory from earlier ones.

The [cheat sheet](./README.md#cheat-sheet) is your reference; this file is
the learning route to it.

---

## Mindset (read once)

- **Buffers, not tabs.** Every file you open is a *buffer*. Tabs are workspace
  separators (e.g. one tab for editing, one for lazygit). VSCode's "tabs" map
  to nvim *buffers*. Almost everything you do switches buffers, not tabs.
- **The leader is `,`.** When you see `<leader>x`, type `,x`.
- **Press a prefix and pause.** which-key will show the next-key menu. Stop
  reading this file and trust the popup once you know a namespace exists.
- **Vim defaults are still in play.** Modern config doesn't replace vim — it
  adds on top. `dd`, `yy`, `p`, `*`, `gg`, `G`, `/`, `:%s/...` all still work.

---

## Lesson 1 — Verify the install (5 min)

Goal: confirm everything is attached and parsing before you go further.

1. Open a TypeScript file: `nvim some_file.ts`
2. Run `:LspInfo` — you should see `vtsls` (and `eslint` if there's an `.eslintrc`).
3. Run `:checkhealth` — skim. Red errors are real; yellow is usually fine.
4. Type a few characters from a known identifier. Popup should auto-appear.
5. Press `K` on a symbol — hover should pop up. `q` or `<Esc>` closes it.

**If anything fails here, don't continue — fix this first.** The README's
"When something is off" section covers the common ones.

---

## Lesson 2 — Buffers (10 min)

This is the biggest mental shift coming back to vim.

**The drill:**
1. From inside nvim (any buffer), `:e file_a.ts` — opens a file.
2. `:e file_b.ts` — opens another. Now you have 2 buffers.
3. `<C-^>` — toggles between the *last two*. Do this 3-4 times until
   it's reflex. This is the single most-used buffer key.
4. `]b` and `[b` — cycle through all buffers in order.
5. `<leader>fb` — fuzzy picker. Type a few letters of either filename
   to jump.
6. `:bd` — close current buffer. Try it; the buffer is gone but nvim isn't.

**Goal:** stop thinking "I need to open a file" and start thinking
"I need to find the buffer I already have, or open a new one." 90% of
your file-switching should use `<C-^>` and `<leader>fb`.

---

## Lesson 3 — Finding things (15 min)

Telescope replaces every "I need to find X" workflow.

**The drill** — in a real project:
1. `<C-p>` (or `<leader>ff`) — find file by name. Type a fragment.
   `<CR>` to open. `<C-x>` opens in horizontal split, `<C-v>` vertical.
2. `<leader>fg` — live grep. Type a pattern; results update as you type.
   `<CR>` jumps to that line.
3. `<leader>fb` — buffer picker (you saw this in lesson 2).
4. `<leader>fr` — resume the *last* picker you used. After a grep, you
   close the results, realize you wanted a different match — `<leader>fr`
   brings the picker back exactly where it was.
5. `<leader>fh` — help tags. Type `:help` topics like `lsp`, `pack`,
   `treesitter`. This is how you learn vim itself.
6. Inside any picker:
   - `<C-n>` / `<C-p>` — move down / up
   - `<C-q>` — send all results to quickfix list (then `:cn`/`:cp` to walk them)
   - `<Esc>` (or `<C-c>`) — quit

**Goal:** stop using `:e <full-path>` for files that already exist in your
project. `<C-p>` is faster.

---

## Lesson 4 — LSP basics (15 min)

The everyday LSP keys. Most are nvim 0.11 defaults, not custom bindings.

**The drill** — in a TypeScript file:
1. Put cursor on an imported symbol. `gd` — jump to definition.
2. `<C-o>` — jump back. `<C-i>` — jump forward. (Jumplist; works
   across all jumps, not just LSP.)
3. `K` — hover docs. Press `K` *again* (within ~1s) to *enter* the
   floating window so you can scroll/copy.
4. `grn` — rename. Type new name, `<CR>`. Renames across the project.
5. `grr` — find references. Opens a quickfix-style picker.
6. `gra` — code actions. Menu of refactors / quick fixes the LSP knows.
7. `gri` — go to implementation (useful for interface methods).
8. `gO` — document symbols. Outline of the current file.
9. `<leader>cf` — format buffer (calls the LSP formatter).

**Memorize first:** `gd`, `K`, `grn`. The rest you can look up via
which-key.

---

## Lesson 5 — Diagnostics (5 min)

LSP errors/warnings show up as virtual text + signcolumn markers.

**The drill:**
1. Introduce a deliberate type error in a `.ts` file. Save.
2. `]d` — jump to the next diagnostic. `[d` — previous.
3. Hover the cursor on the error line; wait a moment — a floating window
   should appear with the message. (If not: it's also visible as virtual
   text at end of line.)
4. `<leader>cq` — apply the LSP's quickfix (when one exists).
5. `<leader>fd` — telescope picker over *all* diagnostics in the workspace.
   Useful before commits to make sure you didn't leave warnings.

---

## Lesson 6 — Completion flow (5 min)

Native nvim 0.12 completion. No nvim-cmp.

**The drill:**
1. Insert mode in a TS file. Start typing a known identifier.
2. Popup auto-appears as you type.
3. `<Tab>` / `<S-Tab>` — cycle through candidates.
4. `<CR>` — accept the highlighted one (or insert a newline if nothing
   is highlighted).
5. `<C-Space>` — manually trigger completion if it didn't pop up
   (rare, but happens after deletion).
6. `<C-e>` — dismiss popup without accepting.
7. `<C-s>` — signature help. Inside a function call, this shows
   parameters as you type.

**Goal:** trust the popup. Don't type whole names — let it complete.

---

## Lesson 7 — File explorer (oil, 10 min)

Oil is *not* a tree. You edit your filesystem like a buffer.

**The drill:**
1. `<leader>e` from any buffer — opens oil for the current dir.
2. `j`/`k` to move, `<CR>` to enter a file or dir.
3. `-` to go up a directory.
4. **The cool part:** in an oil buffer, edit lines like text:
   - Delete a line → that file/dir is queued for deletion
   - Change a line → that file/dir is queued for rename
   - Add a new line → a new file (or `name/` for a dir)
5. `:w` — applies all pending changes at once. Confirmation prompt
   for destructive ops.
6. `g?` inside oil — full keymap reference.

**Goal:** for renaming or moving files, oil is faster than the shell.

---

## Lesson 8 — Git daily flow (15 min)

You have three git tools. They overlap; learn what each is for.

| Tool | Best at |
|---|---|
| **gitsigns** | per-line, per-hunk: stage/reset individual changes |
| **lazygit** | interactive: stage files, write commits, browse log, push, branch |
| **fugitive** | inline blame, `:GBrowse` to GitHub, scripted `:Git ...` from cmdline |

**The drill:**
1. Make a few changes in a tracked file. `+`/`~` markers should appear
   in the signcolumn.
2. `]h` / `[h` — jump between hunks in the file.
3. Cursor on a hunk → `<leader>gp` — preview the hunk.
4. `<leader>gh` — stage that one hunk. Marker should change.
5. `<leader>gr` — reset (discard) the hunk. (Try it on a hunk you
   don't care about — there's no undo for this.)
6. `<leader>gB` — full-line blame as a popup (commit, author, message).
7. `<leader>gg` — opens lazygit in a new tab. Inside lazygit:
   - `space` to stage, `c` to commit, `P` to push, `<C-r>` to refresh
   - `?` for help, `q` to quit (auto-closes the tab)
8. `:Git blame` — opens fugitive's full-window blame. `<CR>` on a line
   to view that commit. `q` to close.

**Goal:** small fixes go through gitsigns + commit in lazygit. Don't
leave nvim for git.

---

## Lesson 9 — Motion (flash, 5 min)

Quick jumps inside the visible screen.

**The drill:**
1. `s` — type two characters that exist somewhere on screen. Labels appear
   on every match.
2. Type the label letter — cursor jumps there.
3. Try in visual mode: `vs<2 chars><label>` — selects from cursor to that point.
4. Try in operator-pending mode: `ds<2 chars><label>` — deletes to there.

**Goal:** for jumps within a screen, `s` beats `/`-search and `f`/`t`
because labels disambiguate immediately.

---

## Lesson 10 — Lean on which-key (5 min)

Stop reading this file. Use the popup.

**The drill:**
1. Press `<leader>` and *do nothing*. Wait 300ms.
2. Popup shows: `c → +code`, `f → +find`, `g → +git`, plus the
   leaf bindings (`e`, `cd`, `gg`, `gb`).
3. Press `f` (still no `<Esc>`). Now you see all `<leader>f...` bindings.
4. `<Esc>` to back out without choosing.
5. Same trick works after `g` (LSP defaults: `gd`, `gO`, `gra...`,
   `grn...`, `grr...`) and `]` / `[`.
6. `:checkhealth which-key` — audits for keymap conflicts.

**Goal:** when stuck, type the prefix and let the popup teach you.

---

## What NOT to learn yet

Vim has *enormous* depth. You don't need any of this to be productive
in the new setup. Acquire as needed:

- **Registers** (`"ay`, `"ap`) — multiple clipboards
- **Macros** (`qa...q`, `@a`) — record/replay key sequences
- **Marks** (`ma`, `'a`) — bookmark positions
- **`:s` and `:g`** — substitute / global commands; very powerful
- **Folds** (`za`, `zR`, `zM`) — collapse code blocks
- **Window splits** (`<C-w>v`, `<C-w>s`, `<C-w>hjkl`) — beyond the basics

These are the deep cuts. Stick to the lessons above first.

---

## Suggested cadence

- **Day 1:** Lessons 1, 2 (install verified, buffer reflexes)
- **Day 2:** Lesson 3 (telescope is the biggest daily win)
- **Day 3:** Lessons 4, 5 (LSP + diagnostics)
- **Day 4:** Lessons 6, 7 (completion + oil)
- **Day 5:** Lesson 8 (git workflow)
- **Day 6:** Lessons 9, 10 (flash + which-key)
- **Week 2+:** stop using this file. Open `README.md` only when stuck.

---

## When you're stuck

In rough order of usefulness:
1. **which-key popup** — press the prefix, see the options.
2. **`:help <topic>`** — `:help :Telescope`, `:help vim.lsp`, `:help oil`.
3. **`<leader>fh`** — fuzzy-search help tags.
4. **`:checkhealth`** — diagnoses any plugin's failures.
5. **`README.md`** — your cheat sheet.
6. **Plugin GitHub READMEs** — telescope, oil, gitsigns, etc. all have
   excellent docs. Search "<plugin> nvim" if a binding isn't doing what
   you expect.
