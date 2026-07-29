return {
  { 'echasnovski/mini.nvim',
    version = '*',
    config = function()

      local nvim_version = string.format("Neovim v%d.%d.%d", vim.version().major, vim.version().minor, vim.version().patch)
      require('mini.starter').setup({
        evaluate_single = true,
          header = table.concat({
            [[               _         ]],
            [[   ____ _   __(_)___ ___ ]],
            [[  / __ \ | / / / __ `__ \]],
            [[ / / / / |/ / / / / / / /]],
            [[/_/ /_/|___/_/_/ /_/ /_/ ]],
            [[                         ]],
          }, '\n'),
          items = {
            { name = 'Empty Buffer',  action = 'enew',                      section = '' },
            { name = 'Recent Files',  action = 'Telescope oldfiles',        section = '' },
            { name = 'Find File',     action = 'Telescope find_files',      section = '' },
            { name = 'Grep Text',     action = 'Telescope live_grep',       section = '' },
            { name = 'Notes',         action = 'edit $HOME/Documents/notes/.', section = '' },
            { name = 'TODO',          action = 'edit $HOME/Documents/notes/TODO.md', section = '' },
            { name = 'Scratch',       action = 'edit $HOME/Documents/notes/scratch.md', section = '' },
            { name = 'Configure',     action = 'edit $HOME/.config/nvim/.', section = '' },
            { name = 'Update',        action = 'Lazy sync',                 section = '' },
            { name = 'Quit',          action = 'q',                         section = '' },
          },
          content_hooks = {
            require('mini.starter').gen_hook.adding_bullet(">  "),
            require('mini.starter').gen_hook.aligning('center', 'center'),
          },
          footer = nvim_version,
          silent = true
      })

      vim.cmd([[
        augroup MiniStarterJK
          au!
          au User MiniStarterOpened nmap <buffer> j <Cmd>lua MiniStarter.update_current_item('next')<CR>
          au User MiniStarterOpened nmap <buffer> k <Cmd>lua MiniStarter.update_current_item('prev')<CR>
          au User MiniStarterOpened nmap <buffer> <C-p> <Cmd>Telescope find_files<CR>
          au User MiniStarterOpened nmap <buffer> <C-n> <Cmd>Telescope file_browser<CR>
        augroup END
        ]])

      require('mini.statusline').setup({
        use_icons = true,
      })

      -- require('mini.comment').setup({
      --   options = {
      --     ignore_blank_line = true,
      --   }
      -- })
      --
      require ('mini.diff').setup({
        view = {
          style = 'sign',
          signs = { add = '+', change = '~', delete = '_' }
        },
        delay = {
          text_change = 30,
        }
      })

      local hipatterns = require('mini.hipatterns')
      hipatterns.setup({
        highlighters = {
          hex_color = hipatterns.gen_highlighter.hex_color(),
        },
        delay = {
          text_change = 30
        }
      })

      require ('mini.ai').setup()
      require ('mini.git').setup()
      require ('mini.icons').setup()
      require ('mini.surround').setup()

    end
  }
}
