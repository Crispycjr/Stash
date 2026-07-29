return {
  {
    'navarasu/onedark.nvim',
    priority = 1000,
    config = function()
      require('onedark').setup {
        style = 'darker',
        colors = {
        },
      }
      require('onedark').load()
    end
  }
}

-- return {
--   {
--     "neanias/everforest-nvim",
--     lazy = false,
--     priority = 1000,
--     config = function()
--       require("everforest").setup({
--         background = "hard",
--       })
--       require("everforest").load()
--     end,
--   },
-- }

-- return {
--   { 'Mofiqul/vscode.nvim',
--     priority = 1000,
--     config = function()
--       vim.cmd.colorscheme "vscode"
--     end
--   }
-- }

