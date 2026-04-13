-- Buffer Management (AstroNvim-style)
local map = vim.keymap.set

-- Close buffer
map("n", "<Leader>c", function()
  require("nvchad.tabufline").close_buffer()
end, { desc = "Close buffer" })

-- Force close buffer (ignores unsaved changes)
map("n", "<Leader>C", function()
  require("nvchad.tabufline").close_buffer(vim.api.nvim_get_current_buf(), true)
end, { desc = "Force close buffer" })

-- Buffer navigation (also available via <Tab>/<S-Tab> from NvChad defaults)
map("n", "]b", function()
  require("nvchad.tabufline").next()
end, { desc = "Next buffer" })

map("n", "[b", function()
  require("nvchad.tabufline").prev()
end, { desc = "Previous buffer" })

-- Close all buffers except current
map("n", "<Leader>bc", function()
  local current = vim.api.nvim_get_current_buf()
  for _, buf in ipairs(vim.t.bufs or {}) do
    if buf ~= current and vim.api.nvim_buf_is_loaded(buf) then
      vim.api.nvim_buf_delete(buf, { force = false })
    end
  end
end, { desc = "Close all buffers except current" })

-- Close all buffers
map("n", "<Leader>bC", function()
  for _, buf in ipairs(vim.t.bufs or {}) do
    if vim.api.nvim_buf_is_loaded(buf) then
      vim.api.nvim_buf_delete(buf, { force = false })
    end
  end
end, { desc = "Close all buffers" })

-- Close buffers to the left
map("n", "<Leader>bl", function()
  local current = vim.api.nvim_get_current_buf()
  for _, buf in ipairs(vim.t.bufs or {}) do
    if buf == current then break end
    if vim.api.nvim_buf_is_loaded(buf) then
      vim.api.nvim_buf_delete(buf, { force = false })
    end
  end
end, { desc = "Close all buffers to the left" })

-- Close buffers to the right
map("n", "<Leader>br", function()
  local current = vim.api.nvim_get_current_buf()
  local found = false
  for _, buf in ipairs(vim.t.bufs or {}) do
    if found and vim.api.nvim_buf_is_loaded(buf) then
      vim.api.nvim_buf_delete(buf, { force = false })
    end
    if buf == current then found = true end
  end
end, { desc = "Close all buffers to the right" })

-- Previous buffer (explicit <Leader>bp in addition to [b)
map("n", "<Leader>bp", function()
  require("nvchad.tabufline").prev()
end, { desc = "Previous buffer" })
