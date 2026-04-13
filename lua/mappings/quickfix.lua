-- Quickfix / Location Lists (AstroNvim-style)
local map = vim.keymap.set

map("n", "<Leader>xq", "<Cmd>copen<CR>", { desc = "Quickfix List" })
map("n", "<Leader>xl", "<Cmd>lopen<CR>", { desc = "Location List" })
