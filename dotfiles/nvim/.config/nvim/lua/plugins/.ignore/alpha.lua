return {
    {
    "goolord/alpha-nvim",
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      local alpha = require'alpha'
      local dashboard = require'alpha.themes.dashboard'

      local version = vim.version()
      local nvim_version = string.format("Neovim v%d.%d.%d", version.major, version.minor, version.patch)

      dashboard.section.header.val = {
        [[                         ]],
        [[                         ]],
        [[               _         ]],
        [[   ____ _   __(_)___ ___ ]],
        [[  / __ \ | / / / __ `__ \]],
        [[ / / / / |/ / / / / / / /]],
        [[/_/ /_/|___/_/_/ /_/ /_/ ]],
        [[                         ]],
      }

      dashboard.section.header.opts = {
        position = "center",
        hl = "String",
      }
      dashboard.section.nvim_version = {
        type = "text",
        val = nvim_version,
        opts = {
          position = "center",
          hl = "Comment",
        }
      }

      dashboard.section.buttons.val = {
        dashboard.button( "e", "  > Empty file" , ":enew <BAR><CR>"),
        dashboard.button( "r", "  > Recent"   ,   ":Telescope oldfiles<CR>"),
        dashboard.button( "n", "  > Notes"    ,   ":edit $HOME/Documents/notes/.<CR>"),
        dashboard.button( "t", "  > TODO"    ,    ":edit $HOME/Documents/notes/TODO.md<CR>"),
        dashboard.button( "c", "  > Configure" ,  ":edit $HOME/.config/nvim/.<CR>"),
        dashboard.button( "u", "  > Update"    ,  ":Lazy sync<CR>"),
        dashboard.button( "q", "󰅚  > Quit Nvim" ,  ":quit<CR>"),
      }

      dashboard.config.layout = {
        dashboard.section.header,
        { type = "padding", val = 0 },
        dashboard.section.nvim_version,
        { type = "padding", val = 2 },
        dashboard.section.buttons,
      }

      dashboard.config.opts.noautocmd = true

      vim.keymap.set('n', '<leader>d', ':Alpha<CR>', { silent = true })

      alpha.setup(dashboard.config)
    end
  },
}
