-- lua/user/lsp.lua
--
-- LSP server configuration and per-buffer wiring.
-- Defines each server's settings via vim.lsp.config(), enables them with
-- vim.lsp.enable(), and on LspAttach: turns on native completion, sets up
-- buffer-local LSP keymaps, document highlighting, and per-server hooks
-- (eslint fix-on-save, gopls format + organize-imports on save).

vim.diagnostic.config({
  virtual_text = { spacing = 2, prefix = '●' },
  signs = true,
  underline = true,
  severity_sort = true,
  float = { border = 'rounded', source = 'if_many' },
})

-- ---- Per-server configs ---------------------------------------------------
-- nvim-lspconfig ships sensible defaults (cmd, root_markers, filetypes) for
-- each of these; vim.lsp.config() merges with them, so we only specify
-- settings/overrides here.

vim.lsp.config('vtsls', {
  settings = {
    typescript = { updateImportsOnFileMove = { enabled = 'always' } },
  },
})

vim.lsp.config('eslint', {
  settings = { workingDirectories = { mode = 'auto' } },
})

vim.lsp.config('jsonls', {})

vim.lsp.config('lua_ls', {
  settings = {
    Lua = {
      runtime = { version = 'LuaJIT' },
      diagnostics = { globals = { 'vim' } },
      workspace = {
        checkThirdParty = false,
        library = vim.api.nvim_get_runtime_file('', true),
      },
      telemetry = { enable = false },
    },
  },
})

vim.lsp.config('gopls', {
  settings = {
    gopls = {
      gofumpt = true,
      staticcheck = true,
      analyses = { unusedparams = true, shadow = true },
      hints = {
        assignVariableTypes = true,
        compositeLiteralFields = true,
        constantValues = true,
        functionTypeParameters = true,
        parameterNames = true,
        rangeVariableTypes = true,
      },
    },
  },
})

-- GDScript: Godot's editor exposes its language server on TCP 6005.
-- vim.lsp.rpc.connect is lazy — connection isn't attempted until a .gd
-- buffer opens. If Godot isn't running, :LspLog shows ECONNREFUSED;
-- that's expected, just open Godot and re-open the file.
vim.lsp.config('gdscript', {
  cmd = vim.lsp.rpc.connect('127.0.0.1', 6005),
  filetypes = { 'gd', 'gdscript', 'gdscript3' },
  root_markers = { 'project.godot' },
})

vim.filetype.add({ extension = { gd = 'gdscript' } })

vim.lsp.enable({ 'vtsls', 'eslint', 'jsonls', 'lua_ls', 'gopls', 'gdscript' })

-- ---- LspAttach: per-buffer wiring -----------------------------------------
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('user-lsp-attach', { clear = true }),
  callback = function(ev)
    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    if not client then return end
    local bufnr = ev.buf
    local opts = { buffer = bufnr, silent = true }

    -- Native auto-completion (Neovim 0.11+ API).
    if client:supports_method('textDocument/completion') then
      vim.lsp.completion.enable(true, client.id, bufnr, { autotrigger = true })
    end

    -- Highlight other occurrences of the symbol under the cursor on idle.
    if client:supports_method('textDocument/documentHighlight') then
      local g = vim.api.nvim_create_augroup('user-lsp-highlight-' .. bufnr, { clear = true })
      vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
        group = g, buffer = bufnr, callback = vim.lsp.buf.document_highlight,
      })
      vim.api.nvim_create_autocmd('CursorMoved', {
        group = g, buffer = bufnr, callback = vim.lsp.buf.clear_references,
      })
    end

    -- ESLint: auto-fix on save (replaces coc-eslint's fix-on-save).
    if client.name == 'eslint' then
      vim.api.nvim_create_autocmd('BufWritePre', {
        buffer = bufnr,
        command = 'LspEslintFixAll',
      })
    end

    -- Go: gofmt convention — organize imports + format on save.
    if client.name == 'gopls' then
      vim.api.nvim_create_autocmd('BufWritePre', {
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.code_action({
            apply = true,
            context = { only = { 'source.organizeImports' }, diagnostics = {} },
          })
          vim.lsp.buf.format({ async = false })
        end,
      })
    end

    -- Buffer-local LSP keymaps.
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'gy', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', 'K',  vim.lsp.buf.hover, opts)
    vim.keymap.set('n', '<leader>rn',  vim.lsp.buf.rename, opts)
    vim.keymap.set({ 'n', 'x' }, '<leader>ca',  vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', '<leader>cac', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', '<leader>qf', function()
      vim.lsp.buf.code_action({ apply = true, context = { only = { 'quickfix' } } })
    end, opts)
    vim.keymap.set({ 'n', 'x' }, '<leader>f', function()
      vim.lsp.buf.format({ async = false })
    end, opts)
  end,
})

-- User commands for occasional manual use.
vim.api.nvim_create_user_command('Format', function() vim.lsp.buf.format() end, {})
vim.api.nvim_create_user_command('OR', function()
  vim.lsp.buf.code_action({ apply = true, context = { only = { 'source.organizeImports' } } })
end, {})
