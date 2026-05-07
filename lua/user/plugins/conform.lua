-- lua/user/plugins/conform.lua
--
-- Formatter dispatcher. Per-filetype formatters listed below run on save
-- (and when <leader>cf is pressed). lsp_format = 'fallback' means: if no
-- formatter is configured for a filetype, use the LSP's formatter
-- (so e.g. GDScript still formats via gopls / godot LSP).
--
-- Required CLI tools (install once via `:MasonInstall ...`):
--   prettier  (TS/JS/JSON/CSS/HTML/MD)
--   stylua    (Lua)
--   goimports (Go: format + organize imports)

require('conform').setup({
  formatters_by_ft = {
    typescript      = { 'prettier' },
    typescriptreact = { 'prettier' },
    javascript      = { 'prettier' },
    javascriptreact = { 'prettier' },
    json            = { 'prettier' },
    css             = { 'prettier' },
    html            = { 'prettier' },
    markdown        = { 'prettier' },
    lua             = { 'stylua' },
    go              = { 'goimports', 'gofmt' },
  },
  format_on_save = {
    timeout_ms = 500,
    lsp_format = 'fallback',
  },
})
