-- lua/user/plugins/surround.lua
--
-- Add / change / delete surrounding characters (parens, quotes, tags).
-- Uses the `gs` prefix because plain `s` is taken by flash.jump.
--
-- Examples (cursor on `foo`):
--   gsaiw"   →  "foo"           (g surround add inside word with ")
--   gsr"'    →  'foo'           (g surround replace " with ')
--   gsd"     →  foo             (g surround delete ")

require('mini.surround').setup({
  mappings = {
    add            = 'gsa',
    delete         = 'gsd',
    find           = 'gsf',
    find_left      = 'gsF',
    highlight      = 'gsh',
    replace        = 'gsr',
    update_n_lines = 'gsn',
  },
})
