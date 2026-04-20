require("nvchad.configs.lspconfig").defaults()

local servers = { "html", "cssls" }
vim.lsp.enable(servers)

vim.lsp.config("csharp_ls", {
  on_init = function(client, _)
    -- Override NvChad's default on_init to keep semantic tokens enabled for csharp_ls
  end,
  cmd = function(dispatchers, config)
    return vim.lsp.rpc.start({ 'csharp-ls', '--features', 'metadata-uris' }, dispatchers, {
      -- csharp-ls attempt to locate sln, slnx or csproj files from cwd, so set cwd to root directory.
      -- If cmd_cwd is provided, use it instead.
      cwd = config.cmd_cwd or config.root_dir,
      env = config.cmd_env,
      detached = config.detached,
    })
  end,
  settings = {
    csharp = {
      logLevel = "debug",
      applyFormattingOptions = true,
      useMetadataUris = true,
      razorSupport = false,
      locale = "en-US",
      debug = {
        debugMode = false,
        solutionLoadDelay = 0,
      }
    },
    capabilities = {
      experimental = { csharp = { metadataUris = true } }
    }
  },
})

vim.lsp.enable("csharp_ls")

vim.lsp.config("ts_ls", {
  init_options = {
    plugins = {
      {
        name = "@vue/typescript-plugin",
        location = vim.fn.stdpath("data") .. "/mason/packages/vue-language-server/node_modules/@vue/language-server",
        languages = { "vue" },
        configNamespace = "typescript",
      },
    },
  },
  filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
})

vim.lsp.enable("ts_ls")
vim.lsp.enable("vue_ls")
