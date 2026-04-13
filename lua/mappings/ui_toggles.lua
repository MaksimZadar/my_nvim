-- UI/UX Toggles (AstroNvim-style)
local map = vim.keymap.set

local function notify(msg) vim.notify(msg, vim.log.levels.INFO) end
local function bool2str(bool) return bool and "on" or "off" end

-- Toggle wrap
map("n", "<Leader>uw", function()
  vim.wo.wrap = not vim.wo.wrap
  notify(("wrap %s"):format(bool2str(vim.wo.wrap)))
end, { desc = "Toggle wrap" })

-- Toggle spell
map("n", "<Leader>us", function()
  vim.wo.spell = not vim.wo.spell
  notify(("spell %s"):format(bool2str(vim.wo.spell)))
end, { desc = "Toggle spellcheck" })

-- Change line numbering (cycles: none -> number -> number+relative -> relative -> none)
map("n", "<Leader>un", function()
  local number = vim.wo.number
  local relativenumber = vim.wo.relativenumber
  if not number and not relativenumber then
    vim.wo.number = true
  elseif number and not relativenumber then
    vim.wo.relativenumber = true
  elseif number and relativenumber then
    vim.wo.number = false
  else
    vim.wo.relativenumber = false
  end
  notify(("number %s, relativenumber %s"):format(bool2str(vim.wo.number), bool2str(vim.wo.relativenumber)))
end, { desc = "Change line numbering" })

-- Toggle diagnostics
map("n", "<Leader>ud", function()
  vim.diagnostic.enable(not vim.diagnostic.is_enabled())
  notify(("diagnostics %s"):format(bool2str(vim.diagnostic.is_enabled())))
end, { desc = "Toggle diagnostics" })

-- Toggle virtual text
local previous_virtual_text
map("n", "<Leader>uv", function()
  local virtual_text = vim.diagnostic.config().virtual_text
  local new_virtual_text = false
  if virtual_text then
    previous_virtual_text = virtual_text
  else
    new_virtual_text = previous_virtual_text or true
  end
  vim.diagnostic.config { virtual_text = new_virtual_text }
  notify(("virtual text %s"):format(bool2str(new_virtual_text and true or false)))
end, { desc = "Toggle virtual text" })

-- Change indent setting
map("n", "<Leader>ui", function()
  local input_avail, input = pcall(vim.fn.input, "Set indent value (>0 expandtab, <=0 noexpandtab): ")
  if input_avail then
    local indent = tonumber(input)
    if not indent or indent == 0 then return end
    vim.bo.expandtab = (indent > 0)
    indent = math.abs(indent)
    vim.bo.tabstop = indent
    vim.bo.softtabstop = indent
    vim.bo.shiftwidth = indent
    notify(("indent=%d %s"):format(indent, vim.bo.expandtab and "expandtab" or "noexpandtab"))
  end
end, { desc = "Change indent setting" })
