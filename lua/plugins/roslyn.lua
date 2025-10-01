return {
    "seblyng/roslyn.nvim",
    ---@module 'roslyn.config'
    ---@type RoslynNvimConfig
    opts = {
        -- your configuration comes here; leave empty for default settings
        filewatching = "auto",
    },
    config = function ()
        vim.lsp.config("roslyn", {
            on_attach = function()
                vim.keymap.set("n", "K", vim.lsp.buf.hover)
                vim.keymap.set("n", "gD", vim.lsp.buf.definition, { desc = "Go to definition" })
                vim.keymap.set("n", "gd", vim.lsp.buf.declaration, { desc = "Go to declaration" })
                vim.keymap.set("n", "gI", vim.lsp.buf.implementation, { desc = "Go to implementation" })
                vim.keymap.set("n", "gT", vim.lsp.buf.type_definition, { desc = "Go to type definition" })

                vim.keymap.set("n", "<leader>la", vim.lsp.buf.code_action, { desc = "Code actions" })
                vim.keymap.set("n", "<leader>lr", vim.lsp.buf.rename, { desc = "Rename under cursor" })
                vim.keymap.set("n", "<leader>lR", vim.lsp.buf.references, { desc = "Show references" })
            end,
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
        })
    end
}
