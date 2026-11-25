-- OPTIONS
----------

vim.opt.runtimepath:prepend(vim.fn.stdpath("data"))
vim.opt.hidden = true
vim.opt.confirm = true
vim.opt.swapfile = false
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true
vim.opt.backspace = "indent,eol,start"
vim.opt.number = true
vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.showmode = false
vim.opt.cmdheight = 0
vim.opt.laststatus = 2
vim.opt.cursorline = true
vim.opt.scrolloff = 6
vim.opt.sidescrolloff = 6
vim.opt.smartcase = true
vim.opt.ignorecase = true
vim.opt.wildignorecase = true
vim.opt.fileignorecase = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.clipboard:append("unnamedplus")
vim.opt.virtualedit = "block"
vim.opt.undofile = true
vim.opt.signcolumn = 'yes'
vim.opt.title = true
vim.opt.termguicolors = true
vim.opt.background = "dark"
vim.opt.compatible = false
vim.opt.autoread = true
-- vim.g.python3_host_prog = '/usr/bin/python3'

-- COMMANDS
-----------

-- Update ripgrep config file
vim.env.RIPGREP_CONFIG_PATH =
    vim.fn.expand("~/.config/ripgrep/nvim")

-- Remove trailing whitespaces before saving
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  command = [[%s/\s\+$//e]]
})

-- Run xrdb whenever Xdefaults or Xresources are saved
vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = {"*Xresources", "*Xdefaults", "*.xrdb"},
  command = 'silent !xrdb $HOME/.Xresources'
})

-- Disable auto-comment on new line
vim.api.nvim_create_autocmd("FileType", {
  pattern = "*",
  callback = function()
    vim.opt_local.formatoptions = vim.opt_local.formatoptions - { "c", "r", "o" }
  end,
})

-- Convert current file to PDF using pandoc
vim.api.nvim_create_user_command(
  'TOpdf',
  function()
    local current_file = vim.fn.expand('%:p') -- absolute path to current file
    local file_dir = vim.fn.expand('%:p:h')   -- directory of the file
    local output_file = vim.fn.expand('%:p:r') .. '.pdf'

    -- cd to the file's directory and run pandoc using only the filename
    local cmd = string.format('cd "%s" && pandoc "%s" -o "%s"', file_dir, vim.fn.expand('%:t'), output_file)

    vim.cmd('!' .. cmd)
  end,
  { desc = 'Convert current file to PDF using pandoc' }
)

