# dotfiles

My `~/.config` directory under version control.

## Layout

- `nvim/` — Neovim config (init.vim, Lua plugins, ftplugins). Loaded via `$XDG_CONFIG_HOME/nvim`.
- `wezterm/` — WezTerm config.
- `fish/` — Fish shell config (currently just env setup under `conf.d/`).
- `git/` — Global git config (`ignore` file applied across all repos).
- `gh/` — GitHub CLI config. `hosts.yml` is gitignored (auth tokens).

## Bootstrap on a new machine

```sh
git clone https://github.com/esseguin/dotfiles ~/.config
ln -s ~/.config/nvim/init.vim ~/.vimrc   # if you also use plain vim
```

Neovim picks up `~/.config/nvim/` automatically via XDG.
