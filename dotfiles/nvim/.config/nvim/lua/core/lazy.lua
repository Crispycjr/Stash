-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Setup lazy.nvim
require("lazy").setup({
  spec = {

{
  "navarasu/onedark.nvim",
  priority = 1000, -- make sure to load this before all the other start plugins
  config = function()
    require("onedark").setup {
      style = "warmer"
    }
    require("onedark").load()
  end
},

{
  "nvim-lua/plenary.nvim",
},

{
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  opts = {
    ensure_installed = {
      "bash",
      "c",
      "dockerfile",
      "gitignore",
      "html",
      "lua",
      "markdown",
      "markdown_inline",
      "python",
      "query",
      "regex",
      "vim",
      "vimdoc",
    },
    sync_install = false,
    auto_install = true,
    highlight = { enable = true },
    indent = { enable = true },
  },
},

{
  "nvim-telescope/telescope.nvim",
  version = '0.1.8',
  config = function()
    local telescope = require('telescope')
    local builtin = require('telescope.builtin')
    vim.keymap.set("n", "<leader>F", builtin.find_files, { desc = "Find Files" })
    vim.keymap.set("n", "<leader>G", builtin.live_grep, { desc = "Live Grep" })
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

{
  "williamboman/mason.nvim",
  config = function()
    require("mason").setup()
  end,
},

{
  "williamboman/mason-lspconfig.nvim",
  dependencies = {
    "williamboman/mason.nvim",
    "neovim/nvim-lspconfig",
  },
  config = function()
    require("mason-lspconfig").setup({
      ensure_installed = {
        "lua_ls",
        "pyright",
      },
    })
  end,
},

{
  "neovim/nvim-lspconfig",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
  },
config = function()
  local capabilities = require("cmp_nvim_lsp").default_capabilities()

  local on_attach = function(_, bufnr)
    local opts = { buffer = bufnr }

    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
    vim.keymap.set("n", "<leader>k", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
  end

  vim.lsp.config("lua_ls", {
    capabilities = capabilities,
    on_attach = on_attach,
    settings = {
      Lua = {
        diagnostics = {
          globals = { "vim" },
        },
      },
    },
  })

  vim.lsp.config("pyright", {
    capabilities = capabilities,
    on_attach = on_attach,
  })

  vim.lsp.config("bashls", {
    capabilities = capabilities,
    on_attach = on_attach,
  })

  vim.lsp.enable({
    "lua_ls",
    "pyright",
    "bashls",
  })
end,},

{
  "hrsh7th/nvim-cmp",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "L3MON4D3/LuaSnip",
  },
  config = function()
    local cmp = require("cmp")

    cmp.setup({
      snippet = {
        expand = function(args)
          require("luasnip").lsp_expand(args.body)
        end,
      },

      mapping = cmp.mapping.preset.insert({
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<S-Enter>"] = cmp.mapping.confirm({ select = true }),
      }),

      sources = {
        { name = "nvim_lsp" },
      },
    })
  end,
},

{
  "echasnovski/mini.nvim",
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
      augroup END
      ]])

    require('mini.statusline').setup({
      use_icons = true,
    })

    require('mini.comment').setup({
      options = {
        ignore_blank_line = true,
      }
    })

    require ('mini.diff').setup({
      view = {
        style = 'sign',
        signs = { add = '+', change = '~', delete = '_' }
      },
      delay = {
        text_change = 50,
      }
    })

    local hipatterns = require('mini.hipatterns')
    hipatterns.setup({
      highlighters = {
        hex_color = hipatterns.gen_highlighter.hex_color(),
      },
      delay = {
        text_change = 50
      }
    })

    require ('mini.ai').setup()
    require ('mini.git').setup()
    require ('mini.icons').setup()
    require ('mini.surround').setup()

  end
},

{
  "rolv-apneseth/tfm.nvim",
  config = function()
    require("tfm").setup({
      file_manager = "lf",
      replace_netrw = true,
      ui = {
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
  end
},

{
  'folke/zen-mode.nvim',
  config = function()
    vim.keymap.set('n', '<leader>z', ':ZenMode<CR>', { silent = true })
    require('zen-mode').setup({
      window = {
        backdrop = 1,
        width = .60,
        height = .85,
        options = {
          signcolumn = "no",
          number = false,
        },
      },
    })
  end
},

-- {
--   "epwalsh/obsidian.nvim",
--   version = "*",
--   lazy = true,
--   ft = "markdown",
--   opts = {
--     workspaces = {
--       {
--         name = "Notes",
--         path = "~/Documents/notes",
--       },
--     },
--     disable_frontmatter = true,
--   },
-- },

{
  'dhruvasagar/vim-table-mode',
},


  },
  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  install = { colorscheme = { "onedark" } },
  -- automatically check for plugin updates
  checker = { enabled = false },
  change_detection = { enabled = false },
})

vim.diagnostic.config({
  virtual_text = true,
  signs = false,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
})
