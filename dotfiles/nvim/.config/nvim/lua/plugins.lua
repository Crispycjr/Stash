-- PLUGINS
----------

vim.pack.add({
  { src = "vague2k/vague.nvim"},
  { src = "nvim-treesitter/nvim-treesitter"},
  { src = "echasnovski/mini.nvim"},
  { src = "ibhagwan/fzf-lua"},
  { src = "rolv-apneseth/tfm.nvim"},
  { src = "folke/zen-mode.nvim"},
  { src = "dhruvasgar/vim-table-mode"},
  -- { src = ""},
  -- { src = ""},
  -- { src = ""},
  -- { src = ""},
})

vim.cmd.colorscheme("vague")

-- PLUGIN CONFIGS
-----------------

require("plugins.nvim-treesitter")
require("plugins.mini")
require("plugins.fzf-lua")
require("plugins.tfm")
require("plugins.zen-mode")

