-- lua/user/plugins.lua
--
-- Plugin declarations via vim.pack (Neovim 0.12 built-in manager).
-- vim.pack.add is synchronous: missing plugins are cloned on the spot,
-- added to runtimepath, and :packadd-ed before this function returns.
-- That means plugin require()s in later modules just work.

vim.pack.add({
  -- Colorscheme
  { src = 'https://github.com/navarasu/onedark.nvim' },

  -- LSP installer + server config defaults
  { src = 'https://github.com/mason-org/mason.nvim' },
  { src = 'https://github.com/mason-org/mason-lspconfig.nvim' },
  { src = 'https://github.com/neovim/nvim-lspconfig' },

  -- Treesitter (main branch = modern API used in treesitter.lua)
  { src = 'https://github.com/nvim-treesitter/nvim-treesitter', version = 'main' },
  { src = 'https://github.com/nvim-treesitter/nvim-treesitter-textobjects', version = 'main' },

  -- Telescope + deps
  { src = 'https://github.com/nvim-lua/plenary.nvim' },
  { src = 'https://github.com/nvim-telescope/telescope.nvim' },
  { src = 'https://github.com/nvim-telescope/telescope-fzf-native.nvim' },

  -- File explorer
  { src = 'https://github.com/stevearc/oil.nvim' },

  -- Statusline + icons
  { src = 'https://github.com/nvim-lualine/lualine.nvim' },
  { src = 'https://github.com/nvim-tree/nvim-web-devicons' },

  -- Unified split/pane nav with wezterm (see plugins/smart-splits.lua)
  { src = 'https://github.com/mrjones2014/smart-splits.nvim' },

  -- Motion + UX
  { src = 'https://github.com/folke/flash.nvim' },
  { src = 'https://github.com/folke/zen-mode.nvim' },
  { src = 'https://github.com/folke/which-key.nvim' },
  { src = 'https://github.com/folke/trouble.nvim' },
  { src = 'https://github.com/echasnovski/mini.surround' },

  -- Formatter dispatcher (runs prettier/stylua/goimports etc, falls back to LSP)
  { src = 'https://github.com/stevearc/conform.nvim' },

  -- In-buffer markdown rendering (headings, code blocks, lists, tables, etc.)
  { src = 'https://github.com/MeanderingProgrammer/render-markdown.nvim' },

  -- Git
  { src = 'https://github.com/tpope/vim-fugitive' },
  { src = 'https://github.com/tpope/vim-rhubarb' },
  { src = 'https://github.com/lewis6991/gitsigns.nvim' },
})

-- vim.pack has no per-plugin build hook, so handle telescope-fzf-native's
-- `make` step here. Fires on install + update; skips on delete.
vim.api.nvim_create_autocmd('PackChanged', {
  callback = function(ev)
    if ev.data.spec.name == 'telescope-fzf-native.nvim' and ev.data.kind ~= 'delete' then
      vim.system({ 'make' }, { cwd = ev.data.path }):wait()
    end
  end,
})
