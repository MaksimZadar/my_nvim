require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- roslyn bindings
map("n", "K", vim.lsp.buf.hover, { desc = "LSP Hover"})
map("n", "gi", vim.lsp.buf.implementation, {desc = "LSP Go to Implementation"})

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
