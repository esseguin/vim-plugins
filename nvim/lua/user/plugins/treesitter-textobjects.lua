-- lua/user/plugins/treesitter-textobjects.lua
--
-- Treesitter-aware text objects: select / delete / yank / change a
-- function, class, or parameter as a unit. Parsers handle the syntax
-- so this works the same in TS, Lua, Go, GDScript, etc.
--
-- Selection (visual + operator-pending):
--   af / if   around / inside function
--   ac / ic   around / inside class
--   aa / ia   around / inside parameter (argument)
--
-- Examples:
--   daf       delete entire function
--   yif       yank function body
--   caf       change a function (delete + insert mode)
--   vac       visually select around the class
--
-- Movement:
--   ]f / [f   next / prev function start
--   ]F / [F   next / prev function end

require('nvim-treesitter-textobjects').setup({
  select = { lookahead = true },
  move   = { set_jumps = true },
})

local select = require('nvim-treesitter-textobjects.select').select_textobject
local move   = require('nvim-treesitter-textobjects.move')

local function pick(query) return function() select(query, 'textobjects') end end

local map = vim.keymap.set
map({ 'x', 'o' }, 'af', pick('@function.outer'))
map({ 'x', 'o' }, 'if', pick('@function.inner'))
map({ 'x', 'o' }, 'ac', pick('@class.outer'))
map({ 'x', 'o' }, 'ic', pick('@class.inner'))
map({ 'x', 'o' }, 'aa', pick('@parameter.outer'))
map({ 'x', 'o' }, 'ia', pick('@parameter.inner'))

map('n', ']f', function() move.goto_next_start('@function.outer', 'textobjects') end)
map('n', '[f', function() move.goto_previous_start('@function.outer', 'textobjects') end)
map('n', ']F', function() move.goto_next_end('@function.outer', 'textobjects') end)
map('n', '[F', function() move.goto_previous_end('@function.outer', 'textobjects') end)
