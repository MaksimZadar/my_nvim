local options = {
  async = true,
  formatters_by_ft = {
    lua = { "stylua" },
    cs = { "csharpier_custom" },
    csproj = { "csharpier_custom" }
  },
  formatters = {
    csharpier_custom = {
      command = "csharpier",
      args = {
        "format",
        "--write-stdout",
        "--stdin-path",
        "$FILENAME",
      },
      to_stdin = true,
    }
  }
}

return options
