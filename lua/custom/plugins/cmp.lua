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
            'kristijanhusak/vim-dadbod-completion'
        },
        -- use a release tag to download pre-built binaries
        version = 'v0.*',

        --[[
        ---@module 'blink.cmp'
        ---@type blink.cmp.Config
            ]] --
        opts = {
            keymap = { preset = 'default' },
            completion = {
                menu = {
                    border = 'rounded',
                    draw = {
                        align_to_component = 'label', -- or 'none' to disable
                        padding = 1,
                        gap = 1,
                        columns = { { 'kind_icon' }, { 'label', 'label_description', gap = 1 }, { 'kind' } },
                    },
                },
                documentation = {
                    auto_show = true,
                    treesitter_highlighting = true,
                    window = {
                        border = 'rounded',
                        direction_priority = {
                            menu_north = { 'e', 'w' },
                            menu_south = { 'e', 'w' },
                        },
                    },
                },
                -- Displays a preview of the selected item on the current line
                ghost_text = {
                    enabled = false,
                },
            },

            signature = {
                enabled = false,
                window = {
                    border = 'rounded',
                    direction_priority = { 'n', 's' },
                },
            },

            sources = {
                completion = {
                    enabled_providers = { 'lsp', 'path', 'snippets', 'buffer', 'dadbod' },
                },
                providers = {
                    dadbod = { name = "Dadbod", module = "vim_dadbod_completion.blink" },
                },
            },
        },
        opts_extend = { "sources.completion.enabled_providers" }
    },
}
