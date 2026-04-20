return {
  {
    "stevearc/conform.nvim",
    opts = require "configs.conform",
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  -- {
  --   "tris203/roslyn.nvim",
  --   branch = "0.12",
  --   ft = { "cs" },
  --   opts = {
  --     filewatching = "roslyn",
  --     debug = true,
  --   },
  --   config = function(_, opts)
  --     require("roslyn").setup(opts)
  --
  --     vim.lsp.config("roslyn", {
  --         settings = {
  --           ["csharp|code_lens"] = {
  --             dotnet_enable_references_code_lens = true,
  --           },
  --           ["csharp|completion"] = {
  --             dotnet_show_completion_items_from_unimported_namespaces = true,
  --             dotnet_show_name_completion_suggestions = true
  --           },
  --           ["csharp|inlay_hints"] = {
  --             dotnet_enable_inlay_hints_for_object_creation_parameters = true,
  --             dotnet_enable_inlay_hints_for_other_parameters = true,
  --             dotnet_enable_inlay_hints_for_parameters = true
  --           },
  --           ["csharp|background_analysis"] = {
  --             dotnet_compiler_diagnostics_scope = "openFiles",
  --             dotnet_analyzer_diagnostics_scope = "openFiles"
  --           }
  --         }
  --     })
  --   end
  -- },

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

  -- ToggleTerm (AstroNvim-style terminal management)
  -- Keymaps are in lua/mappings/terminal.lua (loaded at startup).
  -- Lazy-loading via cmd: the <Cmd>ToggleTerm<CR> in the keymaps triggers lazy load automatically.
  -- Do NOT use a `keys` spec here -- it would overwrite the mappings from terminal.lua.
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

  -- Gitsigns: override on_attach to add AstroNvim-style buffer-local git mappings
  {
    "lewis6991/gitsigns.nvim",
    opts = {
      on_attach = function(bufnr)
        require("mappings.git").on_attach(bufnr)
      end,
    },
  },

  -- Smart-splits: wrap-around window navigation + multiplexer integration (AstroNvim-style)
  {
    "mrjones2014/smart-splits.nvim",
    lazy = true,
    event = "VeryLazy",
    opts = {
      ignored_filetypes = { "nofile", "quickfix", "qf", "prompt" },
      ignored_buftypes = { "nofile" },
    },
  },

  -- Which-key: add AstroNvim-style group labels
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
}
