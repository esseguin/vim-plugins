-- lua/user/completion.lua
--
-- Native insert-mode completion settings (Neovim 0.12+).
-- The actual `vim.lsp.completion.enable(...)` call happens per-buffer in
-- lsp.lua's LspAttach handler. This file just configures the surrounding
-- popup behavior and the <CR>/<Tab>/<C-Space> keymaps.

vim.opt.completeopt = { 'menu', 'menuone', 'noinsert', 'popup' }
vim.opt.shortmess:append('c')

-- <CR>: if popup is open and an item is highlighted, accept it (<C-y>).
-- If popup is open with no selection, dismiss + insert newline.
-- If popup is closed, plain newline.
vim.keymap.set('i', '<CR>', function()
  if vim.fn.pumvisible() == 1 then
    return vim.fn.complete_info({ 'selected' }).selected ~= -1
      and '<C-y>' or '<C-y><CR>'
  end
  return '<CR>'
end, { expr = true })

-- Manual completion trigger (replaces coc's <C-Space>).
vim.keymap.set('i', '<C-Space>', function() vim.lsp.completion.get() end)

-- Tab/Shift-Tab cycle the popup when it's open; otherwise pass through.
vim.keymap.set('i', '<Tab>', function()
  return vim.fn.pumvisible() == 1 and '<C-n>' or '<Tab>'
end, { expr = true })
vim.keymap.set('i', '<S-Tab>', function()
  return vim.fn.pumvisible() == 1 and '<C-p>' or '<S-Tab>'
end, { expr = true })
