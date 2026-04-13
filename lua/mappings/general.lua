-- General / Standard Operations (AstroNvim-style)
local map = vim.keymap.set

-- Convenience
map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- Smart j/k (move by visual line on wrapped lines)
map({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true, desc = "Move cursor down" })
map({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true, desc = "Move cursor up" })

-- Standard ops
map("n", "<Leader>w", "<Cmd>w<CR>", { desc = "Save" })
map("n", "<Leader>q", "<Cmd>confirm q<CR>", { desc = "Quit window" })
map("n", "<Leader>Q", "<Cmd>confirm qall<CR>", { desc = "Quit all" })
map("n", "<Leader>n", "<Cmd>enew<CR>", { desc = "New file" })
map("n", "<C-q>", "<Cmd>q!<CR>", { desc = "Force quit" })

-- Splits
map("n", "|", "<Cmd>vsplit<CR>", { desc = "Vertical split" })
map("n", "\\", "<Cmd>split<CR>", { desc = "Horizontal split" })

-- Comment (add comment above/below current line)
map("n", "gco", "o<Esc>Vcx<Esc><Cmd>normal gcc<CR>fxa<BS>", { desc = "Add comment below" })
map("n", "gcO", "O<Esc>Vcx<Esc><Cmd>normal gcc<CR>fxa<BS>", { desc = "Add comment above" })

-- Stay in indent mode (visual)
map("v", "<Tab>", ">gv", { desc = "Indent line" })
map("v", "<S-Tab>", "<gv", { desc = "Unindent line" })

-- Navigate tabs
map("n", "]t", "<Cmd>tabnext<CR>", { desc = "Next tab" })
map("n", "[t", "<Cmd>tabprevious<CR>", { desc = "Previous tab" })
