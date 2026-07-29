return {
   { "nvim-lua/plenary.nvim" },
   { "nvim-treesitter/nvim-treesitter",
   build = ":TSUpdate",
   config = function()
     require'nvim-treesitter.config'.setup({
       ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline", "python", "html", "sql" },
       sync_install = false,
       auto_install = false,
       parser_install_dir = vim.fn.stdpath("data") .. "/parser",
       highlight = { enable = true, },
       })
   end,
 },

  { "nvim-telescope/telescope.nvim",
    version = '0.1.8',
    config = function()
      local telescope = require('telescope')
      local builtin = require('telescope.builtin')

      vim.keymap.set("n", "<leader>F", builtin.find_files, { desc = "Find Files" })

      telescope.setup({
        defaults = {
          file_ignore_patterns = {
            "%.git/", "node_modules/", "%.lock", "%.exe", "%.desktop", "%.jpg", "%.jpeg", "%.webp", "%.png", "%.gif", "%.pdf", "%.webm", "%.mp3", "%.mp4", "%.mkv", "%.docx", "%.odt", "%.pptx", "%.xlsx", "%.deb"
          },
          preview = false,
          scroll_strategy = "cycle",
        }
      })
    end
  },
}
