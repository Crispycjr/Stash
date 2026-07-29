return {
  { 'mark-westerhof/vim-lightline-base16' },
  { 'itchyny/lightline.vim',
    config = function()
      vim.g.lightline = {
        colorscheme = 'base16_tomorrow_night'
      }
    end
  },
}
