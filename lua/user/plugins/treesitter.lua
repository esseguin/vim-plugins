-- lua/user/plugins/treesitter.lua
--
-- nvim-treesitter on the `main` branch. NOTE: the new API does NOT
-- auto-enable highlighting — you have to call vim.treesitter.start()
-- per buffer. The FileType autocmd below does that. If syntax suddenly
-- looks plain, this autocmd is the suspect.
--
-- install({...}) is async and idempotent: parsers download to the data
-- dir on first launch and are reused thereafter.

require('nvim-treesitter').setup()

require('nvim-treesitter').install({
  'typescript', 'tsx', 'javascript',
  'lua',
  'go', 'gomod', 'gosum', 'gowork',
  'gdscript', 'godot_resource',
  'json',
  'markdown', 'markdown_inline',
  'html', 'css',
  'vimdoc', 'query',
})

vim.api.nvim_create_autocmd('FileType', {
  callback = function(ev)
    local ok = pcall(vim.treesitter.start, ev.buf)
    if ok then
      vim.bo[ev.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
    end
  end,
})
