vim.opt.fillchars = { eob = " " }
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.o.guifont = "MonoLisa i3b4cx:h10:i:b"
vim.g.neovide_font_hinting = "full"
vim.g.neovide_font_antialias = true
vim.g.neovide_scale_factor = 1
vim.wo.number = true
vim.opt.undofile = true
vim.opt.termguicolors = true
vim.g.mapleader = " "
vim.o.ignorecase = true

vim.cmd("colorscheme everforest")
vim.cmd("set background=light")
vim.cmd([[highlight clear WinBar]])
vim.cmd([[highlight clear WinBarNC]])
vim.cmd("set laststatus=1")
vim.cmd("cd ~/")
