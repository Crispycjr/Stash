-- PLUGINS
----------

vim.pack.add({
  { src = "https://github.com/vague2k/vague.nvim"},
  { src = "https://github.com/nvim-treesitter/nvim-treesitter"},
  { src = "https://github.com/echasnovski/mini.nvim"},
  { src = "https://github.com/rolv-apneseth/tfm.nvim"},
  { src = "https://github.com/folke/zen-mode.nvim"},
  { src = "https://github.com/dhruvasagar/vim-table-mode"},
  { src = "https://github.com/ibhagwan/fzf-lua"},
})

vim.cmd.colorscheme("vague")

-- PLUGIN CONFIGS
-----------------

require("plugins.nvim-treesitter")
require("plugins.fzf-lua")
require("plugins.mini")
require("plugins.tfm")
require("plugins.zen-mode")

