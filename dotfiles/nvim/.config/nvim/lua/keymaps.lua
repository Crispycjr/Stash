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
vim.keymap.set('n', '<C-c>', '<cmd>close<CR>', silent)

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

