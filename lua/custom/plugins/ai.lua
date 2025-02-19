return {
    {
        "supermaven-inc/supermaven-nvim",
        config = function()
            require("supermaven-nvim").setup({
                keymaps = {
                    accept_suggestion = "<M-y>",
                    clear_suggestion = "<C-]>",
                    accept_word = "<C-j>",
                },
                color = {
                    suggestion_color = "#a89984",
                    cterm = 244,
                },
            })
        end,
    },
}
