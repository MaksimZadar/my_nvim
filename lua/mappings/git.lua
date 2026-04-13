-- Git / Gitsigns (AstroNvim-style)
-- These mappings are set up as buffer-local via gitsigns on_attach.
-- This module returns the on_attach function to be used in the gitsigns plugin config.
local M = {}

function M.on_attach(bufnr)
  local gs = require "gitsigns"
  local map = function(mode, l, r, opts)
    opts = opts or {}
    opts.buffer = bufnr
    vim.keymap.set(mode, l, r, opts)
  end

  -- Navigation
  map("n", "]g", function() gs.nav_hunk "next" end, { desc = "Next Git hunk" })
  map("n", "[g", function() gs.nav_hunk "prev" end, { desc = "Previous Git hunk" })
  map("n", "]G", function() gs.nav_hunk "first" end, { desc = "First Git hunk" })
  map("n", "[G", function() gs.nav_hunk "last" end, { desc = "Last Git hunk" })

  -- Actions
  map("n", "<Leader>gl", function() gs.blame_line() end, { desc = "View Git blame" })
  map("n", "<Leader>gL", function() gs.blame_line { full = true } end, { desc = "View full Git blame" })
  map("n", "<Leader>gp", function() gs.preview_hunk_inline() end, { desc = "Preview Git hunk" })
  map("n", "<Leader>gr", function() gs.reset_hunk() end, { desc = "Reset Git hunk" })
  map("n", "<Leader>gR", function() gs.reset_buffer() end, { desc = "Reset Git buffer" })
  map("n", "<Leader>gs", function() gs.stage_hunk() end, { desc = "Stage Git hunk" })
  map("n", "<Leader>gS", function() gs.stage_buffer() end, { desc = "Stage Git buffer" })
  map("n", "<Leader>gd", function() gs.diffthis() end, { desc = "View Git diff" })

  -- Visual mode hunk actions
  map("v", "<Leader>gr", function()
    gs.reset_hunk { vim.fn.line ".", vim.fn.line "v" }
  end, { desc = "Reset Git hunk" })
  map("v", "<Leader>gs", function()
    gs.stage_hunk { vim.fn.line ".", vim.fn.line "v" }
  end, { desc = "Stage Git hunk" })

  -- Text object
  map({ "o", "x" }, "ig", ":<C-U>Gitsigns select_hunk<CR>", { desc = "inside Git hunk" })
end

return M
