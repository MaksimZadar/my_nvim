return {
  "stevearc/conform.nvim",
  opts = {},
  config = function()
    require("conform").setup({
      formatters_by_ft = {
        cs = {"my_csharpier"},
        csproj = {"my_csharpier"}
      },
      formatters = {
        my_csharpier = {
          command = "csharpier",
          args = {
            "format",
            "--write-stdout"
          },
          to_stdin = true
        }
      },
      format_on_save = {
        timeout_ms = 5000
      }
    })
  end
}
