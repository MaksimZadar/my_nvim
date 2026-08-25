require "nvchad.autocmds"

-- Refresh and display codelens (e.g. "3 references") for LSP servers that support it
vim.api.nvim_create_autocmd({ "BufEnter", "InsertLeave", "CursorHold" }, {
  callback = function()
    local clients = vim.lsp.get_clients { bufnr = 0 }
    for _, client in ipairs(clients) do
      if client.supports_method("textDocument/codeLens") then
        vim.lsp.codelens.refresh { bufnr = 0 }
        return
      end
    end
  end,
})

-- Open NvimTree on startup when launching without a file
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    if vim.fn.argc() == 0 and vim.api.nvim_buf_get_name(0) == "" then
      require("nvim-tree.api").tree.open()
    end
  end,
})
