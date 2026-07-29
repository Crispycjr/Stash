return {
  {
    'nvim-tree/nvim-web-devicons',
    config = function()
      require'nvim-web-devicons'.setup {
        override = {
          default_icon = {
            icon = "",
            color = "#D8D8D8",
            cterm_color = "253",
            name = "Default"
          },
          txt = {
            icon = "",
            color = "#D8D8D8",
            cterm_color = "253",
            name = "Txt"
          },
          md = {
            icon = "",
            color = "#D8D8D8",
            cterm_color = "253",
            name = "Markdown"
          },
        };
      }
    end
  },
}
