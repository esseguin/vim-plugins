-- lua/user/plugins/mason.lua
--
-- Mason is the LSP / formatter / linter installer (replaces what coc
-- did with `:CocInstall`). mason-lspconfig bridges Mason package names
-- to nvim-lspconfig server names.
--
-- automatic_installation is off so installs only happen when you ask
-- (via :Mason). ensure_installed is the audit list — :Mason highlights
-- which of these are missing.

require('mason').setup()

require('mason-lspconfig').setup({
  ensure_installed = { 'vtsls', 'eslint', 'jsonls', 'lua_ls', 'gopls' },
  automatic_installation = false,
  -- gdscript intentionally absent — it's served by Godot itself via TCP.
})
