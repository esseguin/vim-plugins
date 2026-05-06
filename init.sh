#!/bin/bash
# Bootstrap on a fresh machine.
# Assumes: Neovim 0.12+ already installed (e.g. `brew install neovim`).

set -e

# Symlink so ~/.config/nvim and ~/.vimrc point at this repo.
[ -L ~/.config/nvim ] || ln -s ~/.vim ~/.config/nvim
[ -L ~/.vimrc ]       || ln -s ~/.config/nvim/init.vim ~/.vimrc

# First nvim launch will:
#   - vim.pack clones every plugin into ~/.local/share/nvim/site/pack/...
#   - the PackChanged autocmd builds telescope-fzf-native (`make`)
#   - treesitter `install({...})` downloads parsers
# Then run `:Mason` and install: vtsls, eslint, jsonls, lua_ls, gopls
# (or trust mason-lspconfig's ensure_installed list).

# External deps used by plugins / LSPs:
#   brew install fd ripgrep node go tree-sitter-cli
#   tree-sitter-cli is required by nvim-treesitter (main branch) to compile parsers
#   (the `tree-sitter` brew formula is just the C library — `tree-sitter-cli` is the binary)
#   ripgrep is required by Telescope live_grep
#   node is required by vtsls / eslint / jsonls
#   go is required by gopls
#   GDScript LSP is provided by Godot itself (TCP 6005) — install Godot separately.

echo "Symlinks set. Run 'nvim' to bootstrap plugins, then ':Mason' to install LSPs."
