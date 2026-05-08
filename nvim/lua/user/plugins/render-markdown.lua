-- lua/user/plugins/render-markdown.lua
--
-- In-buffer markdown rendering: headings get icons + background tints,
-- code blocks get a subtle frame, lists get bullets, tables align, etc.
-- Uses the markdown / markdown_inline treesitter parsers (already installed
-- in plugins/treesitter.lua) and nvim-web-devicons for code-block icons.
--
-- The plugin auto-enables for `markdown` filetype. Toggle on demand with
-- `:RenderMarkdown toggle` (or buffer-local :RenderMarkdown enable/disable).

require('render-markdown').setup({})
