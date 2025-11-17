return {
    "seblyng/roslyn.nvim",
    ---@module 'roslyn.config'
    ---@type RoslynNvimConfig
    opts = {
        filewatching = "roslyn",
        -- Add these settings to help with project loading
    },
    config = function(_, opts)
        require("roslyn").setup(opts)

        vim.lsp.config("roslyn", {
            config = {
                settings = {
                    ["csharp|code_lens"] = {
                        dotnet_enable_references_code_lens = true,
                    },
                    ["csharp|completion"] = {
                        dotnet_show_completion_items_from_unimported_namespaces = true,
                        dotnet_show_name_completion_suggestions = true
                    },
                    ["csharp|inlay_hints"] = {
                        dotnet_enable_inlay_hints_for_object_creation_parameters = true,
                        dotnet_enable_inlay_hints_for_other_parameters = true,
                        dotnet_enable_inlay_hints_for_parameters = true
                    },
                    ["csharp|background_analysis"] = {
                        dotnet_compiler_diagnostics_scope = "fullSolution",
                        dotnet_analyzer_diagnostics_scope = "fullSolution"
                    }
                }
            }
        })
        -- Add keybindings after LSP attaches
        vim.api.nvim_create_autocmd("LspAttach", {
            pattern = "*.cs",
            callback = function(args)
                local client = vim.lsp.get_client_by_id(args.data.client_id)
                if client and client.name == "roslyn" then
                    local bufnr = args.buf
                    vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = bufnr })
                    vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to declaration", buffer = bufnr })
                    vim.keymap.set("n", "gI", vim.lsp.buf.implementation, { desc = "Go to implementation", buffer = bufnr })
                    vim.keymap.set("n", "gT", vim.lsp.buf.type_definition, { desc = "Go to type definition", buffer = bufnr })
                    vim.keymap.set("n", "<leader>la", vim.lsp.buf.code_action, { desc = "Code actions", buffer = bufnr })
                    vim.keymap.set("n", "<leader>lr", vim.lsp.buf.rename, { desc = "Rename under cursor", buffer = bufnr })
                    vim.keymap.set("n", "<leader>lR", vim.lsp.buf.references, { desc = "Show references", buffer = bufnr })
                end
            end,
        })
    end
}
