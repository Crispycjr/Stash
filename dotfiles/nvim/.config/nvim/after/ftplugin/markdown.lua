-- OPTIONS
----------

vim.opt.conceallevel = 2

-- COMMANDS
-----------

-- Copy the fg color from a source group and apply it bold to a target
local function link_highlight_with_bold(target, source)
  local ok, hl = pcall(vim.api.nvim_get_hl, 0, { name = source })
  if ok and hl.fg then
    vim.api.nvim_set_hl(0, target, { fg = hl.fg, bold = true })
  else
    -- fallback to bold if color lookup failed
    vim.api.nvim_set_hl(0, target, { bold = true })
  end
end

-- Highlight markdown headers
-- link_highlight_with_bold("markdownH1", "Title")
-- link_highlight_with_bold("markdownH2", "Conditional")
-- link_highlight_with_bold("markdownH3", "String")
-- link_highlight_with_bold("markdownH4", "Constant")
-- link_highlight_with_bold("markdownH5", "Type")
-- link_highlight_with_bold("markdownH6", "Comment")

