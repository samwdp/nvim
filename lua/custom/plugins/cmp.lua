return { -- Autocompletion
    {
        'saghen/blink.compat',
        version = '*',
        opts = {
            impersonate_nvim_cmp = true,
            enable_events = false,
        },
    },
    {
        'saghen/blink.cmp',
        lazy = false, -- lazy loading handled internally
        dependencies = {
            'rafamadriz/friendly-snippets',
            "epwalsh/obsidian.nvim",
        },
        -- use a release tag to download pre-built binaries
        version = 'v0.*',

        ---@module 'blink.cmp'
        ---@type blink.cmp.Config
        opts = {
            keymap = { preset = 'default' },

            highlight = {
                use_nvim_cmp_as_default = true,
            },
            nerd_font_variant = 'mono',
            sources = {
                completion = {
                    enabled_providers = { 'lsp', 'path', 'snippets', 'buffer',
                        'dadbod',
                        },
                },
                providers = {
                    dadbod = { name = "Dadbod", module = "vim_dadbod_completion.blink" },
                }
            },
            windows = {
                autocomplete = {
                    border = 'rounded',
                    draw = {
                        columns = { { "kind_icon" }, { "label", "label_description", gap = 1 }, { "kind" } },
                    },
                },
                documentation = {
                    border = 'rounded',
                    auto_show = true,
                    direction_priority = {
                        autocomplete_north = { 'e', 'w' },
                        autocomplete_south = { 'e', 'w' },
                    },
                },
                signature_help = {
                    border = 'rounded',
                },
            },

            trigger = { signature_help = { enabled = true } }
        },
        opts_extend = { "sources.completion.enabled_providers" }
    },
}
