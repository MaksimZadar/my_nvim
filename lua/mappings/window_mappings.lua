-- Window Navigation & Resize (via smart-splits.nvim, AstroNvim-style)
-- Provides wrap-around window navigation and multiplexer integration (tmux/wezterm/kitty)
local map = vim.keymap.set

-- Navigation (wraps around at edges)
map("n", "<C-h>", function() require("smart-splits").move_cursor_left() end, { desc = "Move to left split" })
map("n", "<C-j>", function() require("smart-splits").move_cursor_down() end, { desc = "Move to below split" })
map("n", "<C-k>", function() require("smart-splits").move_cursor_up() end, { desc = "Move to above split" })
map("n", "<C-l>", function() require("smart-splits").move_cursor_right() end, { desc = "Move to right split" })

-- Resize
map("n", "<C-Up>", function() require("smart-splits").resize_up() end, { desc = "Resize split up" })
map("n", "<C-Down>", function() require("smart-splits").resize_down() end, { desc = "Resize split down" })
map("n", "<C-Left>", function() require("smart-splits").resize_left() end, { desc = "Resize split left" })
map("n", "<C-Right>", function() require("smart-splits").resize_right() end, { desc = "Resize split right" })
