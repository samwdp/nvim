return {
    {
        "seblj/roslyn.nvim",
        dependencies = {
            "tris203/rzls.nvim",
        },
        config = function()
            require("rzls").setup({})
            -- local capabilities = vim.lsp.protocol.make_client_capabilities()
            -- capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())
            local capabilities = require('blink.cmp').get_lsp_capabilities()
            require("roslyn").setup({
                filewatching = true,
                args = {
                    '--logLevel=Information',
                    '--extensionLogDirectory=' .. vim.fs.dirname(vim.lsp.get_log_path()),
                    '--razorSourceGenerator=' .. vim.fs.joinpath(
                        vim.fn.stdpath 'data' --[[@as string]],
                        'mason',
                        'packages',
                        'roslyn',
                        'libexec',
                        'Microsoft.CodeAnalysis.Razor.Compiler.dll'
                    ),
                    '--razorDesignTimePath=' .. vim.fs.joinpath(
                        vim.fn.stdpath 'data' --[[@as string]],
                        'mason',
                        'packages',
                        'rzls',
                        'libexec',
                        'Targets',
                        'Microsoft.NET.Sdk.Razor.DesignTime.targets'
                    ),
                },
                config = {
                    capabilities = capabilities,
                    handlers = require 'rzls.roslyn_handlers',
                    settings = {
                        ["csharp|inlay_hints"] = {
                            csharp_enable_inlay_hints_for_implicit_object_creation = true,
                            csharp_enable_inlay_hints_for_implicit_variable_types = true,
                            csharp_enable_inlay_hints_for_lambda_parameter_types = true,
                            csharp_enable_inlay_hints_for_types = true,
                            dotnet_enable_inlay_hints_for_indexer_parameters = true,
                            dotnet_enable_inlay_hints_for_literal_parameters = true,
                            dotnet_enable_inlay_hints_for_object_creation_parameters = true,
                            dotnet_enable_inlay_hints_for_other_parameters = true,
                            dotnet_enable_inlay_hints_for_parameters = true,
                            dotnet_suppress_inlay_hints_for_parameters_that_differ_only_by_suffix = true,
                            dotnet_suppress_inlay_hints_for_parameters_that_match_argument_name = true,
                            dotnet_suppress_inlay_hints_for_parameters_that_match_method_intent = true,
                        },
                    },
                },
            })
        end
    }
}
