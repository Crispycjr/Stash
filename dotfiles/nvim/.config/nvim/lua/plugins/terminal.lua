return {
  {
    "akinsho/toggleterm.nvim",
    version = '*',
    config = function()
      require("toggleterm").setup{
        direction = "float",
        shade_terminals = false,
        float_opts = {
          border = "curved",
          width = function()
            return math.floor(vim.o.columns * 0.8)
          end,
          height = function()
            return math.floor(vim.o.lines * 0.8)
          end,
          row = function()
            return math.floor(vim.o.lines * 0.1)
          end,
          col = function()
            return math.floor(vim.o.columns * 0.1)
          end,
        },
        persist_mode = false, -- Ensures new terminals use the updated directory
        start_in_insert = true,
        on_open = function(term)
          local file_dir = vim.fn.expand("%:p:h") -- Get the current file's directory
          if file_dir ~= "" and vim.fn.isdirectory(file_dir) == 1 then
            vim.cmd("lcd " .. vim.fn.fnameescape(file_dir)) -- Change to the valid directory
          end
        end
      }

      -- Keymap to open ToggleTerm with the correct directory
      vim.keymap.set('n', '<leader>t', function()
        local file_dir = vim.fn.expand("%:p:h") -- Get the current file's directory
        if file_dir == "" or vim.fn.isdirectory(file_dir) == 0 then
          file_dir = vim.fn.getcwd() -- Fallback to current working directory
        end
        require("toggleterm.terminal").Terminal:new({
          dir = file_dir -- Set terminal directory to the file's directory or fallback
        }):toggle()
      end, { noremap = true, silent = true })
    end
  },
}

