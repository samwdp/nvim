return {
    {
        "ray-x/lsp_signature.nvim",
        event = "InsertEnter",
        opts = {
            hint_prefix = {
                above = "↙ ", -- when the hint is on the line above the current line
                current = "← ", -- when the hint is on the same line
                below = "↖ " -- when the hint is on the line below the current line
            },
            -- hint_prefix = "🐼 ",
            bind = true,
            handler_opts = {
                border = "rounded"
            }
        },
        config = function(_, opts) require 'lsp_signature'.setup(opts) end
    },
    { -- LSP Configuration & Plugins
        "neovim/nvim-lspconfig",
        dependencies = {
            -- Automatically install LSPs and related tools to stdpath for Neovim
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            "WhoIsSethDaniel/mason-tool-installer.nvim",
            "Decodetalkers/csharpls-extended-lsp.nvim",
            "Hoffs/omnisharp-extended-lsp.nvim",
            "seblj/roslyn.nvim",
            "tris203/rzls.nvim",

            -- Useful status updates for LSP.
            -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
            {
                "j-hui/fidget.nvim",
                opts = {
                    notification = {
                        window = {
                            normal_hl = "Comment", -- Base highlight group in the notification window
                            winblend = 0,          -- Background color opacity in the notification window
                            border = "none",       -- Border around the notification window
                            zindex = 45,           -- Stacking priority of the notification window
                            max_width = 0,         -- Maximum width of the notification window
                            max_height = 0,        -- Maximum height of the notification window
                            x_padding = 1,         -- Padding from right edge of window boundary
                            y_padding = 0,         -- Padding from bottom edge of window boundary
                            align = "bottom",      -- How to align the notification window
                            relative = "editor",   -- What the notification window position is relative to
                        },
                    },
                },
            },

            -- `neodev` configures Lua LSP for your Neovim config, runtime and plugins
            -- used for completion, annotations and signatures of Neovim apis
            { "folke/neodev.nvim", opts = {} },
        },
        opts = { inlay_hints = { enabled = true } },
        config = function()
            require("custom.lsp")
        end,
    },
}
