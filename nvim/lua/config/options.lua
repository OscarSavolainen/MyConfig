local opt = vim.opt

-- Tab / Indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.softtabstop = 2
opt.expandtab = true
opt.smartindent = true
opt.wrap = false

-- Search
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = false

-- Appearance
opt.number = true
opt.relativenumber = true
opt.termguicolors = true -- required by some plugins for full GUI support
opt.colorcolumn = '100' -- adds a line at that column, gives an idea of how much text there is
opt.signcolumn = "yes"
opt.cmdheight = 1
opt.scrolloff = 10
opt.completeopt = "menuone,noinsert,noselect" -- how autocomplete behaves.

-- Behavior
opt.hidden = true -- can make changes to buffers
opt.errorbells = false 
opt.swapfile = false
opt.backup = false
opt.undodir = vim.fn.expand("~/.vim/undodir") -- we have undo option
opt.undofile = true
opt.backspace = "indent,eol,start"
opt.splitright = true
opt.splitbelow = true
opt.autochdir = false
opt.iskeyword:append("-") -- will treat word-word as one word
opt.mouse:append('a') -- mouse is available
opt.clipboard:append("unnamedplus") -- allows us to copy-paste outside/inside VIM
opt.modifiable = true
opt.guicursor = "n-v-c:block,i-ci-ve:ver25-Cursor,r-cr:hor20,o:hor50,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor,sm:block-blinkwait175-blinkoff150-blinkon175"
-- i-ci-ve:block
opt.encoding = "UTF-8"
opt.showmode = false

