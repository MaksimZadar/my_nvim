return { 
  "catppuccin/nvim", 
  name = "catppuccin", 
  priority = 1000,
  config = function ()
    require("catppuccin").setup({
        flavour = "mocha", -- latte, frappe, macchiato, mocha
        default_integrations = true,
        auto_integrations = true,
        integrations = {
            cmp = true,
            gitsigns = true,
            nvimtree = true,
            notify = false,
            telescope = true,
            mini = {
                enabled = true,
                indentscope_color = "",
            },
            -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
        },
    })
    vim.cmd.colorscheme "catppuccin"
  end
}

