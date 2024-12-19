return {
    { -- LSP Configuration & Plugins
        "neovim/nvim-lspconfig",
        dependencies = {
            -- Automatically install LSPs and related tools to stdpath for Neovim
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            "WhoIsSethDaniel/mason-tool-installer.nvim",
            "seblj/roslyn.nvim",
            "tris203/rzls.nvim",
            "saghen/blink.cmp",
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
            {
                "folke/lazydev.nvim",
                ft = "lua", -- only load on lua files
                opts = {
                    library = {
                        -- See the configuration section for more details
                        -- Load luvit types when the `vim.uv` word is found
                        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
                    },
                },
            },
        },
        opts = { inlay_hints = { enabled = true } },
        config = function()
            require("custom.lsp")
        end,
    },
}
