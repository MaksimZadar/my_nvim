-- LSP / Language Tools (AstroNvim-style)
local map = vim.keymap.set

-- Hover and navigation
map("n", "K", vim.lsp.buf.hover, { desc = "LSP Hover" })
map("n", "gi", vim.lsp.buf.implementation, { desc = "LSP Go to Implementation" })

-- Rename
map("n", "<Leader>lr", vim.lsp.buf.rename, { desc = "LSP Rename" })

-- Diagnostics
map("n", "<Leader>ld", function()
  vim.diagnostic.open_float()
end, { desc = "Hover diagnostics" })

map("n", "gl", function()
  vim.diagnostic.open_float()
end, { desc = "Hover diagnostics" })

map("n", "<Leader>li", function()
  vim.cmd.checkhealth "vim.lsp"
end, { desc = "LSP Information" })

map("n", "<leader>la", vim.lsp.buf.code_action, { desc = "Code actions" })

-- Diagnostic navigation by severity
map("n", "]e", function()
  vim.diagnostic.jump { count = vim.v.count1, severity = vim.diagnostic.severity.ERROR }
end, { desc = "Next error" })

map("n", "[e", function()
  vim.diagnostic.jump { count = -vim.v.count1, severity = vim.diagnostic.severity.ERROR }
end, { desc = "Previous error" })

map("n", "]w", function()
  vim.diagnostic.jump { count = vim.v.count1, severity = vim.diagnostic.severity.WARN }
end, { desc = "Next warning" })

map("n", "[w", function()
  vim.diagnostic.jump { count = -vim.v.count1, severity = vim.diagnostic.severity.WARN }
end, { desc = "Previous warning" })

-- Format (relocated from NvChad's <leader>fm to <leader>lf)
map({ "n", "v" }, "<Leader>lf", function()
  require("conform").format { lsp_fallback = true }
end, { desc = "Format file" })

-- Search diagnostics (via Telescope)
map("n", "<Leader>lD", function()
  require("telescope.builtin").diagnostics()
end, { desc = "Search diagnostics" })

-- Search document symbols (via Telescope)
map("n", "<Leader>ls", function()
  require("telescope.builtin").lsp_document_symbols()
end, { desc = "Search symbols" })

-- Find references (via Telescope)
map("n", "<Leader>lR", function()
  require("telescope.builtin").lsp_references()
end, { desc = "Find references" })

-- Toggle symbol outline sidebar
map("n", "<Leader>lS", "<Cmd>Outline!<CR>", { desc = "Toggle symbol outline" })
