local keymap = vim.keymap

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- -- Disables
-- -- When you want to change a habit, make it harder or impossible to do
-- inoremap <esc> <nop>
-- -- Disables arrows in normal and insert modes
-- nnoremap <silent> <ESC>OA <Nop>
-- nnoremap <silent> <ESC>OB <Nop>
-- nnoremap <silent> <ESC>OC <Nop>
-- nnoremap <silent> <ESC>OD <Nop>
-- inoremap <silent> <ESC>OA <Nop>
-- inoremap <silent> <ESC>OB <Nop>
-- inoremap <silent> <ESC>OC <Nop>
-- inoremap <silent> <ESC>OD <Nop>

-- Normal mode
vim.api.nvim_set_keymap("n", "<Leader>w", ":w<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<Leader>wq", ":wq<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<Leader>q", ":q<CR>", { noremap = true })

keymap.set("n", "x", '"_x"')  -- Don't copy to register on 'x'
keymap.set("n", "<c-j>", "<c-w>j")
keymap.set("n", "<c-k>", "<c-w>k")
keymap.set("n", "<c-h>", "<c-w>h")
keymap.set("n", "<c-l>", "<c-w>l")
keymap.set("n", "<Leader>u", "vawU")
keymap.set("n", "<Leader>d", "ddO")
keymap.set("n", "<Leader>,", "0w")
keymap.set("n", "<Leader>.", "$")
keymap.set("n", "<Leader>o", "o<esc>")
keymap.set("n", "<Leader>sv", "<C-w>v") -- split window vertically
keymap.set("n", "<Leader>sh", "<C-w>s") -- split window horizontally
keymap.set("n", "<Leader>se", "<C-w>=") -- make split windows equal width
keymap.set("n", "<Leader>ddf", ":call delete(expand('%'))<cr>") -- delete current file
keymap.set("n", "<Leader><space>", ":noh<cr>")  --remove highlights after text search
keymap.set("n", "<Leader>ac", ":tabnew app/controllers/application_controller.rb<cr>")
keymap.set("n", "<Leader>um", ":tabnew app/models/user.rb<cr>")

-- Plugins
-- nvim-tree
keymap.set("n", "<c-n>", ":NvimTreeToggle<CR>")

-- telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>p', builtin.find_files, {})
vim.keymap.set('n', '<leader>\\', builtin.live_grep, {})
