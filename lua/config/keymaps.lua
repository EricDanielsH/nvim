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

-- Compile and run current C++ file on macOS using iTerm2
local function CompileAndRun()
  local file = vim.fn.expand("%:p") -- full path to current file
  if file:match("%.cpp$") then
    local exe = vim.fn.fnamemodify(file, ":r") -- remove .cpp to get full exe path
    vim.cmd("write")

    local compile_cmd = string.format("g++ -std=c++11 -Wall -Wextra -Wpedantic -O2 -o %q %q", exe, file)
    vim.fn.system(compile_cmd)

    if vim.v.shell_error == 0 then
      local dir = vim.fn.fnamemodify(exe, ":h") -- get directory of the binary
      local bin = vim.fn.fnamemodify(exe, ":t") -- get filename only

      local iterm_script = string.format(
        [[
osascript <<EOF
tell application "iTerm"
  activate
  try
    set newWindow to (create window with default profile)
  on error
    set newWindow to (create tab with default profile)
  end try
  tell current session of newWindow
    write text "cd %s && ./%s; echo \\"\nPress enter to exit...\\"; read"
  end tell
end tell
EOF
]],
        dir,
        bin
      )

      vim.fn.system(iterm_script)
      vim.cmd("redraw!")
    else
      vim.notify("Compilation failed", vim.log.levels.ERROR)
    end
  else
    vim.notify("Not a C++ file", vim.log.levels.WARN)
  end
end

-- Keymaps
vim.keymap.set("n", "<F5>", CompileAndRun, { desc = "Compile and Run C++ (iTerm)" })
vim.keymap.set("n", "<F9>", function()
  vim.cmd("write")
  vim.cmd("!clear")
  CompileAndRun()
end, { desc = "Clear, Compile, and Run C++ (iTerm)" })
