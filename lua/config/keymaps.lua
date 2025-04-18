-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- use `vim.keymap.set` instead

local map = vim.keymap.set

-- Move Lines
map("n", "<S-j>", "<cmd>execute 'move .+' . v:count1<cr>==", { desc = "Move Down" })
map("n", "<S-k>", "<cmd>execute 'move .-' . (v:count1 + 1)<cr>==", { desc = "Move Up" })
map("v", "<S-j>", ":<C-u>execute \"'<,'>move '>+\" . v:count1<cr>gv=gv", { desc = "Move Down" })
map("v", "<S-k>", ":<C-u>execute \"'<,'>move '<-\" . (v:count1 + 1)<cr>gv=gv", { desc = "Move Up" })

-- Select whole text
vim.keymap.set("n", "<C-a>", "gg<S-v>G", { desc = "Select whole text" })
-- Copy whole file
vim.keymap.set("n", "<C-c>", ":%y+ <CR>", { desc = "Copy file" })

-- Add empty line under
vim.keymap.set("n", "<C-cr>", "o<Esc>", { desc = "Empty line under" })
vim.keymap.set("n", "<C-S-cr>", "O<Esc>", { desc = "Empty line above" })

-- Use ctrol backspace to remove a word
vim.keymap.set("i", "<S-BS>", "<C-w>", { desc = "Remove word" })

-- Go to beggining/end of line
vim.keymap.set("n", "L", "$", { desc = "Start line" })
vim.keymap.set("n", "H", "^", { desc = "End line" })

-- Move between buffers
vim.keymap.set("n", "<Tab>", vim.cmd.bnext, { desc = "Next buffer" })
vim.keymap.set("n", "<S-Tab>", vim.cmd.bprevious, { desc = "Prev buffer" })

-- Remove entire line
vim.keymap.set("i", "<A-BS>", "<Esc>ddi", { desc = "Remove line" })

-- floating terminal
map("n", "<c-\\>", function()
  Snacks.terminal(nil, { cwd = LazyVim.root() })
end, { desc = "Terminal (Root Dir)" })

-- Terminal Mappings
map("t", "<C-\\>", "<cmd>close<cr>", { desc = "Hide Terminal" })
