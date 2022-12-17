local set = vim.opt

-- Softtabs, 2 spaces
set.tabstop = 2
set.shiftwidth = 2
set.shiftround = true
set.expandtab = true

-- Numbers
set.number = true
set.relativenumber = true
set.numberwidth = 5

-- Cursor line
set.cursorline = true

-- Appearance
set.termguicolors = true
set.background = 'dark'
set.signcolumn = 'yes'

-- Backspace
set.backspace = "indent,eol,start"

-- Clipboard
set.clipboard:append("unnamedplus")

-- Font
set.guifont = 'Hack:h11'

-- Make it obvious where 80 characters is
-- highlight ColorColumn ctermbg=18
set.textwidth = 80
set.colorcolumn = '80'

-- So that hello-hello is considered a single word
set.iskeyword:append("-")

-- Colorscheme
local status, _ = pcall(vim.cmd, "colorscheme gruvbox")
if not status then
  print("Colorscheme not found")
  return
end
