require('mini.statusline').setup({
  use_icons = false,
})
-- Color overrides
vim.api.nvim_set_hl(0, 'MiniStatuslineModeNormal',  { bg = '#81a2be', fg = '#1d1f21', bold = true })
vim.api.nvim_set_hl(0, 'MiniStatuslineModeInsert',  { bg = '#b5bd68', fg = '#1d1f21', bold = true })
vim.api.nvim_set_hl(0, 'MiniStatuslineModeVisual',  { bg = '#b294bb', fg = '#1d1f21', bold = true })
vim.api.nvim_set_hl(0, 'MiniStatuslineModeReplace', { bg = '#cc6666', fg = '#1d1f21', bold = true })
vim.api.nvim_set_hl(0, 'MiniStatuslineModeCommand', { bg = '#f0c674', fg = '#1d1f21', bold = true })

vim.api.nvim_set_hl(0, 'MiniStatuslineDevinfo',    { fg = '#c5c8c6', bg = '#282a2e' })
vim.api.nvim_set_hl(0, 'MiniStatuslineFilename',   { fg = '#c5c8c6', bg = '#282a2e', bold = true })
vim.api.nvim_set_hl(0, 'MiniStatuslineInactive',   { fg = '#969896', bg = '#1d1f21' })
