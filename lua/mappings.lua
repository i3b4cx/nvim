require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

map("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

map("n", "<leader>lz", "<cmd>Lazy<cr>")
map("n", "lg", "<cmd>LazyGit<cr>")
map("n", "<leader>z", "<cmd>ZenMode<cr>")
-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
