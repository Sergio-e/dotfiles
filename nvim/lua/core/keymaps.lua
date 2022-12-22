local keymap = vim.keymap
local api = vim.api

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
api.nvim_set_keymap("n", "<Leader>v", ":vnew <C-R>=escape(expand('%:p:h'), ' ') . '/'<CR>", { noremap = true })
api.nvim_set_keymap("n", "<Leader>w", ":w<CR>", { noremap = true })
api.nvim_set_keymap("n", "<Leader>wq", ":wq<CR>", { noremap = true })
api.nvim_set_keymap("n", "<Leader>ww", ":wqa<CR>", { noremap = true })
api.nvim_set_keymap("n", "<Leader>q", ":q<CR>", { noremap = true })
api.nvim_set_keymap("n", "<Leader>qq", ":qa<CR>", { noremap = true })

keymap.set("n", "Q", "<nop>")
keymap.set("n", "x", '"_x"') -- Don't copy to register on 'x'
keymap.set("n", "<c-j>", "<c-w>j")
keymap.set("n", "<c-k>", "<c-w>k")
keymap.set("n", "<c-h>", "<c-w>h")
keymap.set("n", "<c-l>", "<c-w>l")
keymap.set("n", "<Leader>u", "vawU")
keymap.set("n", "<Leader>d", "ddO")
keymap.set("n", "<Leader>,", "0w")
keymap.set("n", "<Leader>.", "$")
keymap.set("n", "<Leader>o", "o<esc>")
keymap.set("n", "<leader>ss", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
keymap.set("n", "<Leader>sv", "<C-w>v") -- split window vertically
keymap.set("n", "<Leader>sh", "<C-w>s") -- split window horizontally
keymap.set("n", "<Leader>se", "<C-w>=") -- make split windows equal width
keymap.set("n", "<Leader>ddf", ":call delete(expand('%'))<cr>") -- delete current file
keymap.set("n", "<Leader><space>", ":noh<cr>") --remove highlights after text search
keymap.set("n", "<Leader>ac", ":tabnew app/controllers/application_controller.rb<cr>")
keymap.set("n", "<Leader>um", ":tabnew app/models/user.rb<cr>")

-- Insert mode
api.nvim_set_keymap("i", "jk", "<esc>", { noremap = true })
api.nvim_set_keymap("i", "jj", "<esc>", { noremap = true })

-- Visual mode
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Plugins
-- nvim-tree
keymap.set("n", "<c-n>", ":NvimTreeToggle<CR>")

-- telescope
local builtin = require("telescope.builtin")
keymap.set("n", "<leader>p", builtin.find_files, {})
keymap.set("n", "\\", builtin.live_grep, {})

-- copilot
keymap.set("i", "<Leader>]", "<Plug>(copilot-next)", { silent = true })
keymap.set("i", "<Leader>[", "<Plug>(copilot-previous)", { silent = true })

-- neotest
keymap.set("n", "<leader>s", ":lua require('neotest').run.run()<CR>") -- run nearest test
keymap.set("n", "<leader>t", ":lua require('neotest').run.run(vim.fn.expand('%'))<CR>") -- run current file
keymap.set("n", "<leader>a", ":lua require('neotest').run.run(vim.fn.getcwd())<CR>") -- run all tests
keymap.set("n", "<leader>ta", ":lua require('neotest').run.attach()<CR>") -- attach to test
keymap.set("n", "<leader>to", ":lua require('neotest').output.open()<CR>") -- see test output

-- harpoon
keymap.set("n", "<leader>h", ":lua require('harpoon.ui').toggle_quick_menu()<CR>")
keymap.set("n", "<leader>m", ":lua require('harpoon.mark').add_file()<CR>")
keymap.set("n", "<leader>1", ":lua require('harpoon.ui').nav_file(1)<CR>")
keymap.set("n", "<leader>2", ":lua require('harpoon.ui').nav_file(2)<CR>")
keymap.set("n", "<leader>3", ":lua require('harpoon.ui').nav_file(3)<CR>")
keymap.set("n", "<leader>4", ":lua require('harpoon.ui').nav_file(4)<CR>")
keymap.set("n", "<leader>5", ":lua require('harpoon.ui').nav_file(5)<CR>")

-- persisted
keymap.set("n", "<leader>ses", ":SessionSave<CR>")
keymap.set("n", "<leader>sel", ":SessionLoad<CR>")
keymap.set("n", "<leader>sep", ":Telescope persisted<CR>")
