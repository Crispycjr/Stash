return {
  {
    "epwalsh/obsidian.nvim",
    version = "*",
    lazy = true,
    ft = "markdown",
    opts = {
      workspaces = {
        {
          name = "Notes",
          path = "~/Documents/notes",
        },
      },
      disable_frontmatter = true,
    },
  },

  -- {
  --   "SCJangra/table-nvim",
  --   ft = "markdown",
  --   opts = {},
  -- },
}

