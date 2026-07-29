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

-- KEYMAPS
----------

-- Map leader key
vim.keymap.set('', ';', '<Nop>', { silent = true })
vim.g.mapleader = ';'
vim.g.maplocalleader = ';'

local silent = { silent = true }

-- Movement keys
local movement = {
  { 'H', 'h' },
  { 'J', 'gj' },
  { 'K', 'gk' },
  { 'L', 'l' },
  { 'gl', '$' },
}

-- Apply to normal / visual / block
for _, map in ipairs(movement) do
  vim.keymap.set({ 'n', 'v', 'x' }, map[1], map[2], silent)
end

-- Normal mode extras
vim.keymap.set('n', 'gj', 'L', silent)
vim.keymap.set('n', 'gk', 'H', silent)
vim.keymap.set('n', 'gm', 'M', silent)
vim.keymap.set('n', '<A-d>', 'D', silent)
vim.keymap.set('n', 'D', '<C-d>', silent)
vim.keymap.set('n', 'U', '<C-u>', silent)


-- Visual mode extras
vim.keymap.set({ 'v', 'x' }, 'gj', 'L', silent)
vim.keymap.set({ 'v', 'x' }, 'gk', 'H', silent)
vim.keymap.set({ 'v', 'x' }, 'gm', 'M', silent)

-- Splits
vim.keymap.set('n', '<C-h>', '<C-w>h', silent)
vim.keymap.set('n', '<C-j>', '<C-w>j', silent)
vim.keymap.set('n', '<C-k>', '<C-w>k', silent)
vim.keymap.set('n', '<C-l>', '<C-w>l', silent)
vim.keymap.set('n', '<C-A-j>', '<cmd>vertical resize -3<CR>', silent)
vim.keymap.set('n', '<C-A-k>', '<cmd>vertical resize +3<CR>', silent)

-- Tabs
vim.keymap.set('n', '<C-t>', '<cmd>tabnew<CR>', silent)
vim.keymap.set('n', '<A-k>', '<cmd>tabnext<CR>', silent)
vim.keymap.set('n', '<A-j>', '<cmd>tabprevious<CR>', silent)
vim.keymap.set('n', '<A-S-j>', '<cmd>tabmove -1<CR>', silent)
vim.keymap.set('n', '<A-S-k>', '<cmd>tabmove +1<CR>', silent)

-- Quit current window
vim.keymap.set('n', '<C-q>', '<cmd>qall<CR>', silent)

-- Close current window
vim.keymap.set('n', '<C-c>', '<C-w>c', silent)

-- Keep yank
vim.keymap.set('v', 'p', '"_dP', silent)

-- Stay in indent mode
vim.keymap.set('v', '<', '<gv', silent)
vim.keymap.set('v', '>', '>gv', silent)

-- Global search/replace shortcut
vim.keymap.set('n', '<C-f>', ':%s//g<Left><Left>')
vim.keymap.set('v', '<C-f>', ':s//g<Left><Left>')

-- Clear search query
vim.keymap.set('n', '<C-/>', '<cmd>nohlsearch<CR>', silent)

-- Disable operation (Unmap)
vim.keymap.set('n', 'q', '<Nop>', silent)

-- Check spelling
vim.keymap.set('n', 'gs', '<cmd>setlocal spell! spelllang=en_us<CR>', silent)

-- Run TOpdf
vim.keymap.set('n', 'gp', '<cmd>TOpdf<CR>', silent)

-- Open terminal split
local function open_terminal(cmd)
  vim.cmd(cmd)
  vim.cmd('terminal')
  vim.cmd('startinsert')
end

vim.keymap.set('n', '<leader>ts', function()
  open_terminal('split')
end, silent)

vim.keymap.set('n', '<leader>tv', function()
  open_terminal('vsplit')
end, silent)

-- vim.keymap.set('t', '<Esc>', [[<C-\><C-n>]], silent)

-- COMMANDS
-----------

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
