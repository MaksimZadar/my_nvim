-- Customize Mason

---@type LazySpec
return {
  -- use mason-tool-installer for automatically installing Mason packages
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    -- overrides `require("mason-tool-installer").setup(...)`
    opts = {
      -- Make sure to use the names found in `:Mason`
      ensure_installed = {
        -- install language servers
      },
    },
    config = function ()
      require("mason").setup({
          registries = {
              "github:mason-org/mason-registry",
              "github:Crashdummyy/mason-registry",
          },
      })
    end
  },
}
