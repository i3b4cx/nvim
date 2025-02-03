vim.opt.fillchars = { eob = " " }
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.o.guifont = "MonoLisa i3b4cx:i:h11"
vim.wo.number = true
vim.opt.undofile = true
vim.opt.termguicolors = true
vim.g.mapleader = " "

vim.cmd("set background=light")
vim.cmd("colorscheme everforest")
vim.cmd([[highlight clear WinBar]])
vim.cmd([[highlight clear WinBarNC]])
vim.cmd("set laststatus=1")
vim.cmd("cd ~/")
