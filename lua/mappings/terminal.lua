-- Terminal / ToggleTerm (AstroNvim-style)
local map = vim.keymap.set

-- Toggle terminal (F7 and Ctrl+')
map("n", "<F7>", '<Cmd>execute v:count . "ToggleTerm"<CR>', { desc = "Toggle terminal" })
map("t", "<F7>", "<Cmd>ToggleTerm<CR>", { desc = "Toggle terminal" })
map("i", "<F7>", "<Esc><Cmd>ToggleTerm<CR>", { desc = "Toggle terminal" })
map("n", "<C-'>", '<Cmd>execute v:count . "ToggleTerm"<CR>', { desc = "Toggle terminal" })
map("t", "<C-'>", "<Cmd>ToggleTerm<CR>", { desc = "Toggle terminal" })
map("i", "<C-'>", "<Esc><Cmd>ToggleTerm<CR>", { desc = "Toggle terminal" })

-- Directional terminals
map("n", "<Leader>tf", "<Cmd>ToggleTerm direction=float<CR>", { desc = "ToggleTerm float" })
map("n", "<Leader>th", "<Cmd>ToggleTerm size=10 direction=horizontal<CR>", { desc = "ToggleTerm horizontal split" })
map("n", "<Leader>tv", "<Cmd>ToggleTerm size=80 direction=vertical<CR>", { desc = "ToggleTerm vertical split" })

-- Lazygit (only if both git and lazygit are available)
if vim.fn.executable "git" == 1 and vim.fn.executable "lazygit" == 1 then
  local lazygit = nil

  local function toggle_lazygit()
    local Terminal = require("toggleterm.terminal").Terminal
    if lazygit == nil or not lazygit:is_open() and not vim.api.nvim_buf_is_valid(lazygit.bufnr or -1) then
      lazygit = Terminal:new {
        cmd = "lazygit",
        hidden = true,
        direction = "float",
        float_opts = {
          border = "rounded",
          width = function() return math.floor(vim.o.columns * 0.9) end,
          height = function() return math.floor(vim.o.lines * 0.9) end,
        },
        on_open = function(_)
          vim.cmd "startinsert!"
        end,
        on_exit = function()
          lazygit = nil
        end,
      }
    end
    lazygit:toggle()
  end

  map("n", "<Leader>gg", toggle_lazygit, { desc = "ToggleTerm lazygit" })
  map("n", "<Leader>tl", toggle_lazygit, { desc = "ToggleTerm lazygit" })
end

-- Terminal window navigation (smart-splits for wrap-around + multiplexer support)
map("t", "<C-h>", function() require("smart-splits").move_cursor_left() end, { desc = "Terminal left window navigation" })
map("t", "<C-j>", function() require("smart-splits").move_cursor_down() end, { desc = "Terminal down window navigation" })
map("t", "<C-k>", function() require("smart-splits").move_cursor_up() end, { desc = "Terminal up window navigation" })
map("t", "<C-l>", function() require("smart-splits").move_cursor_right() end, { desc = "Terminal right window navigation" })
