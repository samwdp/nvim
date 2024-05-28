return {
    { -- Adds git related signs to the gutter, as well as utilities for managing changes
        'lewis6991/gitsigns.nvim',
        opts = {
            signs                             = {
                add          = { text = '┃' },
                change       = { text = '┃' },
                delete       = { text = '_' },
                topdelete    = { text = '‾' },
                changedelete = { text = '~' },
                untracked    = { text = '┆' },
            },
            signcolumn                        = true,  -- Toggle with `:Gitsigns toggle_signs`
            numhl                             = false, -- Toggle with `:Gitsigns toggle_numhl`
            linehl                            = false, -- Toggle with `:Gitsigns toggle_linehl`
            word_diff                         = false, -- Toggle with `:Gitsigns toggle_word_diff`
            watch_gitdir                      = {
                follow_files = true
            },
            auto_attach                       = true,
            attach_to_untracked               = false,
            current_line_blame                = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
            current_line_blame_opts           = {
                virt_text = true,
                virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
                delay = 1000,
                ignore_whitespace = false,
                virt_text_priority = 100,
            },
            current_line_blame_formatter      = '<author>, <author_time:%Y-%m-%d> - <summary>',
            current_line_blame_formatter_opts = {
                relative_time = false,
            },
            sign_priority                     = 6,
            update_debounce                   = 100,
            status_formatter                  = nil,   -- Use default
            max_file_length                   = 40000, -- Disable if file is longer than this (in lines)
            preview_config                    = {
                -- Options passed to nvim_open_win
                border = 'single',
                style = 'minimal',
                relative = 'cursor',
                row = 0,
                col = 1
            },
        }
    },
    {                       -- Useful plugin to show you pending keybinds.
        "folke/which-key.nvim",
        event = "VimEnter", -- Sets the loading event to 'VimEnter'
        config = function() -- This is the function that runs, AFTER loading
            require("which-key").setup()

            -- Document existing key chains
            require("which-key").register({
                ["<leader>c"] = { name = "[C]ode", _ = "which_key_ignore" },
                ["<leader>d"] = { name = "[D]ocument", _ = "which_key_ignore" },
                ["<leader>r"] = { name = "[R]ename", _ = "which_key_ignore" },
                ["<leader>s"] = { name = "[S]earch", _ = "which_key_ignore" },
                ["<leader>w"] = { name = "[W]orkspace", _ = "which_key_ignore" },
                ["<leader>h"] = { name = "[H]arpoon", _ = "which_key_ignore" },
            })
        end,
    },
    {
        "folke/todo-comments.nvim",
        event = "VimEnter",
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = { signs = true },
    },
    {
        "norcalli/nvim-colorizer.lua",
        config = function()
            require("colorizer").setup()
        end,
    },
    {
        "HiPhish/rainbow-delimiters.nvim"
    },
    {
        'stevearc/dressing.nvim',
        config = function()
            require('dressing').setup()
        end,
    },
    {
        "nvim-focus/focus.nvim",
        config = function()
            require("focus").setup()
        end
    },
}
