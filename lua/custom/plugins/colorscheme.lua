return {
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
    config = function()
        -- Default options:
        require("gruvbox").setup({
            terminal_colors = true, -- add neovim terminal colors
            undercurl = true,
            underline = true,
            bold = true,
            italic = {
                strings = false,
                emphasis = false,
                comments = false,
                operators = false,
                folds = false,
            },
            strikethrough = true,
            invert_selection = false,
            invert_signs = false,
            invert_tabline = false,
            invert_intend_guides = false,
            inverse = false, -- invert background for search, diffs, statuslines and errors
            contrast = "",  -- can be "hard", "soft" or empty string
            palette_overrides = {},
            overrides = {
                Comment = { link = "GruvboxGreenBold" },
                Statement = { link = "GruvboxRedBold" },
                Conditional = { link = "GruvboxYellowBold" },
                Repeat = { link = "GruvboxYellowBold" },
                Keyword = { link = "GruvboxYellowBold" },
                Function = { link = "GruvboxBlueBold" },
                Identifier = { link = "GruvboxPurple" },
                Include = { link = "GruvboxYellowBold" },
                Type = { link = "GruvboxAquaBold" },
                Typedef = { link = "GruvboxRed" },
                Directory = { link = "GruvboxBlueBold" },
                Constant = { link = "GruvboxAqua" },
                Special = { link = "GruvboxPurple" },
                ContextVt = { link = "GruvboxFg3" },
                BlinkCmpMenu = { link = "GruvboxBg1" },
                BlinkCmpMenuBorder = { link = "GruvboxFg0" },
                -- BlinkCmpKind = { link = "GruvboxGreenBold" },
                -- BlinkCmpLabelDeprecated = { link = "GruvboxRedBold" },
                -- BlinkCmpLabelMatch = { link = "GruvboxAquaBold" },
                -- BlinkCmpLabelDetail = { link = "GruvboxRedBold" },

                BlinkCmpLabel = { link = "GruvboxFg0" },
            },
            dim_inactive = false,
            transparent_mode = true,
        })
        vim.cmd.colorscheme("gruvbox")
    end,
}
