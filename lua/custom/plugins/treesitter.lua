return {
    { -- Highlight, edit, and navigate code
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        opts = {
            ensure_installed = { "c", "html", "lua", "markdown" },
            -- Autoinstall languages that are not installed
            auto_install = true,
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = { "ruby" },
            },
            indent = { enable = true, disable = { "ruby" } },
            incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection = "<M-n>",
                    node_incremental = "<M-n>",
                    scope_incremental = "<M-e>",
                    node_decremental = "<M-p>",
                },
            },
        },
        config = function(_, opts)
            ---@diagnostic disable-next-line: missing-fields
            require("nvim-treesitter.configs").setup(opts)
            local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
            parser_config.razor = {
                install_info = {
                    url = "https://github.com/tree-sitter/tree-sitter-razor", -- local path or git repo
                    files = { "src/parser.c" },                               -- note that some parsers also require src/scanner.c or src/scanner.cc
                    -- optional entries:
                    branch = "master",                                        -- default branch in case of git repo if different from master
                    generate_requires_npm = true,                             -- if stand-alone parser without npm dependencies
                    requires_generate_from_grammar = false,                   -- if folder contains pre-generated src/parser.c
                },
                filetype = "razor",                                           -- if filetype does not match the parser name
            }
        end,
    },
    {
        "nvim-treesitter/nvim-treesitter-context",
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
        }
    },
    {
        'nvim-treesitter/nvim-treesitter-textobjects',
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
        },
        config = function()
            ---@diagnostic disable-next-line: missing-fields
            require('nvim-treesitter.configs').setup({
                textobjects = {
                    select = {
                        include_surrounding_whitespace = true,
                        enable = true,
                        lookahead = true,
                        keymaps = {
                            ["af"] = { query = "@function.outer", desc = "Select outer function" },
                            ["if"] = { query = "@function.inner", desc = "Select inner function" },
                            ["ac"] = { query = "@class.inner", desc = "Select outer part of a class region" },
                            ["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
                        },
                    },
                },
            })
        end,
    },
    {
        "andersevenrud/nvim_context_vt",
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
        },
        config = function()
            require('nvim_context_vt').setup({
                prefix = '⤚'
            })
        end
    },
}
