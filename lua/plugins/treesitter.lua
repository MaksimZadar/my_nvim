-- Customize Treesitter

---@type LazySpec
return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    ensure_installed = {
      "lua",
      "vim",
      "c_sharp",
      "json",
      "xml",
      "yaml",
      "dockerfile",
      "editorconfig",
      "gitignore",
      -- add more arguments for adding more treesitter parsers
    },
  },
  config = function()
    require("nvim-treesitter.install").prefer_git = true
  end
}
