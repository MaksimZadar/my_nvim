return {
  {
    "stevearc/conform.nvim",
    opts = require "configs.conform",
  },
  {
    "j-hui/fidget.nvim",
    opts = {
      -- options
    },
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = {
      registries = {
        "github:mason-org/mason-registry",
        "github:Crashdummyy/mason-registry",
      },
      ensure_installed = {
        "lua-language-server",
        "xmlformatter",
        "yaml-language-server",
        "markdown-oxide",
        "roslyn",
        "netcoredbg",
      },
    },
  },
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    cmd = { "ToggleTerm", "TermExec" },
    opts = {
      size = function(term)
        if term.direction == "horizontal" then
          return 10
        elseif term.direction == "vertical" then
          return 80
        end
      end,
      close_on_exit = true,
      float_opts = { border = "rounded" },
    },
  },
  {
    "lewis6991/gitsigns.nvim",
    opts = {
      on_attach = function(bufnr)
        require("mappings.git").on_attach(bufnr)
      end,
    },
  },
  {
    "mrjones2014/smart-splits.nvim",
    lazy = true,
    event = "VeryLazy",
    opts = {
      ignored_filetypes = { "nofile", "quickfix", "qf", "prompt" },
      ignored_buftypes = { "nofile" },
    },
  },
  {
    "folke/which-key.nvim",
    opts = {
      spec = {
        { "<Leader>b", group = "Buffers" },
        { "<Leader>f", group = "Find" },
        { "<Leader>g", group = "Git" },
        { "<Leader>l", group = "Language Tools" },
        { "<Leader>p", group = "Packages" },
        { "<Leader>t", group = "Terminal" },
        { "<Leader>u", group = "UI/UX" },
        { "<Leader>x", group = "Quickfix/Lists" },
      },
    },
  },
  {
    "hedyhli/outline.nvim",
    cmd = { "Outline", "OutlineOpen" },
    opts = {
      outline_window = {
        position = "right",
        width = 30,
        auto_close = false,
        auto_jump = false,
        show_cursorline = true,
      },
    },
  },
}
