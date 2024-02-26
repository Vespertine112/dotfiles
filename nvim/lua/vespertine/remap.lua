-- Specific plugin key bindings are in their respective files

-- SET THE MAP LEADER!
vim.g.mapleader = " "

-- Misc key setups
vim.keymap.set("n", "<leader>pv", ":Oil<CR>")
vim.keymap.set('', '<C-S>', ':w<CR>')

-- Handle line movement up and down
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "L", ":m '>+1<CR>gv=gv")

-- Center align when searching
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Pastes Copy Buffer over the highlighted section, while maintaining the buffer
vim.keymap.set("x", "<leader>p", [["_dP]])

-- Yanks into the system clipboard so it can be pasted out of nvim
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- Quick fix navigations
vim.keymap.set("n", "<C-;>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>;", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- Highlighted word global replace
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Chmod +x for current file
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- Word movement snapping
vim.keymap.set("n", "<C-Right>", "e")
vim.keymap.set("n", "<C-Left>", "b")
vim.keymap.set("v", "<C-Right>", "e")
vim.keymap.set("v", "<C-Left>", "b")
vim.keymap.set("i", "<C-Right>", "<Esc>ea")

-- Word Deletes baby! Good ref: https://stackoverflow.com/questions/1373841/vim-deleting-backward-tricks
vim.keymap.set("i", "<C-Del>", "<C-o>dw")
vim.keymap.set("i", "<C-H>", "<C-o>dvb")

