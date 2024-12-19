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
        dependencies = {
            'rafamadriz/friendly-snippets',
            'kristijanhusak/vim-dadbod-completion',
        },
        version = 'v0.*',

        opts = {
            keymap = { preset = 'default' },

            appearance = {
                use_nvim_cmp_as_default = true,
                nerd_font_variant = 'mono'
            },

            completion = {
                menu = {
                    border = 'rounded',
                    draw = {
                        columns = { { 'kind_icon' }, { 'label', 'label_description', gap = 1 }, { 'kind' } },
                    }
                },
                documentation = {
                    auto_show = true,
                    window = {
                        border = 'rounded',
                        direction_priority = {
                            menu_north = { 'e', 'w', },
                            menu_south = { 'e', 'w', },
                        },
                    }
                }
            },

            sources = {
                completion = { completion_providers = { 'lsp', 'path', 'snippets', 'buffer', 'lazydev', 'dadbod' } },
                providers = {
                    lsp = { fallback_for = { "lazydev" } },
                    lazydev = { name = "LazyDev", module = "lazydev.integrations.blink" },
                    dadbod = { name = "Dadbod", module = "vim_dadbod_completion.blink" },
                },
            },

            signature = {
                enabled = true,
                window = {
                    border = 'rounded',
                },
            }
        },
        opts_extend = { "sources.default" }
    },
}
