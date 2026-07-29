return {
  {
    "rolv-apneseth/tfm.nvim",
    config = function()
      require("tfm").setup({
        file_manager = "lf",
        replace_netrw = true,
        ui = {
          border = "rounded",
          height = 0.8,
          width = 0.8,
          x = 0.5,
          y = 0.4,
        }
      })
      vim.api.nvim_set_keymap("n", "<leader>f", "", {
        noremap = true,
        callback = require("tfm").open,
      })
    end,
  },
}
