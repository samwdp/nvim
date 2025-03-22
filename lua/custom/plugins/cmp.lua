return { -- Autocompletion
    {
        'saghen/blink.cmp',
        dependencies = {
            "giuxtaposition/blink-cmp-copilot",
            'rafamadriz/friendly-snippets',
            'kristijanhusak/vim-dadbod-completion',
            'onsails/lspkind.nvim',
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
                        components = {
                            kind_icon = {
                                ellipsis = false,
                                text = function(ctx)
                                    local lspkind = require("lspkind")
                                    local icon = ctx.kind_icon
                                    if vim.tbl_contains({ "Path" }, ctx.source_name) then
                                        local dev_icon, _ = require("nvim-web-devicons").get_icon(ctx.label)
                                        if dev_icon then
                                            icon = dev_icon
                                        end
                                    else
                                        icon = require("lspkind").symbolic(ctx.kind, {
                                            mode = "symbol",
                                        })
                                    end

                                    return icon .. ctx.icon_gap
                                end,

                                -- Optionally, use the highlight groups from nvim-web-devicons
                                -- You can also add the same function for `kind.highlight` if you want to
                                -- keep the highlight groups in sync with the icons.
                                highlight = function(ctx)
                                    local hl = ctx.kind_hl
                                    if vim.tbl_contains({ "Path" }, ctx.source_name) then
                                        local dev_icon, dev_hl = require("nvim-web-devicons").get_icon(ctx.label)
                                        if dev_icon then
                                            hl = dev_hl
                                        end
                                    end
                                    return hl
                                end,
                            }
                        }
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
