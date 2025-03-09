return { -- Autocompletion
    {
        'saghen/blink.cmp',
        dependencies = {
            "giuxtaposition/blink-cmp-copilot",
            'rafamadriz/friendly-snippets',
            'kristijanhusak/vim-dadbod-completion',
            {
                'saghen/blink.compat',
                version = '*',
                opts = {
                    impersonate_nvim_cmp = true,
                    enable_events = false,
                },
            },
        },

        version = '*',

        ---@module 'blink.cmp'
        ---@type blink.cmp.Config
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
                        }
                    }
                },
            },
            signature = {
                enabled = true,
                window = { border = 'rounded' }
            },
            sources = {
                default = { 'lsp',
                    'path',
                    'snippets',
                    'buffer',
                    'lazydev',
                    'dadbod',
                    'obsidian',
                    'obsidian_tags',
                    'obsidian_new',
                    'avante_commands',
                    'avante_mentions',
                    'avante_files',
                    'copilot',
                },
                providers = {
                    lsp = { fallbacks = { "lazydev" } },
                    lazydev = { name = "LazyDev", module = "lazydev.integrations.blink" },
                    dadbod = { name = "Dadbod", module = "vim_dadbod_completion.blink" },
                    obsidian = {
                        name = "obsidian",
                        module = "blink.compat.source",
                    },
                    obsidian_new = {
                        name = "obsidian_new",
                        module = "blink.compat.source",
                    },
                    obsidian_tags = {
                        name = "obsidian_tags",
                        module = "blink.compat.source",
                    },
                    avante_commands = {
                        name = "avante_commands",
                        module = "blink.compat.source",
                        score_offset = 90, -- show at a higher priority than lsp
                        opts = {},
                    },
                    avante_files = {
                        name = "avante_files",
                        module = "blink.compat.source",
                        score_offset = 100, -- show at a higher priority than lsp
                        opts = {},
                    },
                    avante_mentions = {
                        name = "avante_mentions",
                        module = "blink.compat.source",
                        score_offset = 1000, -- show at a higher priority than lsp
                        opts = {},
                    },
                    copilot = {
                        name = "copilot",
                        module = "blink-cmp-copilot",
                        score_offset = 100,
                        async = true,
                    },
                },
            },
        },
        opts_extend = { "sources.default" }
    },
}
