require("nvchad.configs.lspconfig").defaults()

local servers = { "html", "cssls" }
vim.lsp.enable(servers)

vim.lsp.config("roslyn", {
  settings = {
    -- better performance
    ["csharp|background_analysis"] = {
      dotnet_analyzer_diagnostics_scope = "openFiles",
      dotnet_compiler_diagnostics_scope = "openFiles",
    },
  },
})
-- read :h vim.lsp.config for changing options of lsp servers 
