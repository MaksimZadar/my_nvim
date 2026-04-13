require "nvchad.autocmds"

-- Open NvimTree on startup when launching without a file
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    if vim.fn.argc() == 0 and vim.api.nvim_buf_get_name(0) == "" then
      require("nvim-tree.api").tree.open()
    end
  end,
})
