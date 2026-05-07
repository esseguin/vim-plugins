-- lua/user/plugins/gitsigns.lua
--
-- In-buffer git: changed-line markers in the signcolumn, hunk
-- navigation, and per-hunk stage/reset/preview without leaving the
-- file. Complements fugitive (`:Git blame`, `:GBrowse`) and lazygit
-- (interactive staging/committing); gitsigns owns the per-line view.
--
-- Buffer-local keymaps are bound in on_attach so they only exist in
-- buffers under git control.

require('gitsigns').setup({
  on_attach = function(bufnr)
    local gs = require('gitsigns')
    local map = function(mode, lhs, rhs, desc)
      vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
    end

    -- Hunk navigation
    map('n', ']h', function() gs.nav_hunk('next') end, 'next hunk')
    map('n', '[h', function() gs.nav_hunk('prev') end, 'prev hunk')

    -- Hunk operations
    map('n', '<leader>gh', gs.stage_hunk,         'stage hunk')
    map('n', '<leader>gr', gs.reset_hunk,         'reset hunk')
    map('n', '<leader>gp', gs.preview_hunk,       'preview hunk')
    map('n', '<leader>gd', gs.diffthis,           'diff this file')
    map('n', '<leader>gB', function() gs.blame_line({ full = true }) end, 'blame line (full)')
  end,
})
