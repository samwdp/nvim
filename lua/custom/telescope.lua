local actions = require("telescope.actions")

require("telescope").setup({
    defaults = {
        mappings = {
            n = { ["q"] = require("telescope.actions").close },
        },
        border = {},
        color_devicons = true,
    },
    pickers = {
        oldfiles = {
            theme = "ivy"
        },
        resume = {
            theme = "ivy"
        },
        diagnostics = {
            theme = "ivy"
        },
        live_grep = {
            theme = "ivy"
        },
        grep_string = {
            theme = "ivy"
        },
        find_files = {
            theme = "ivy"
        },
        keymaps = {
            theme = "ivy"
        },
        help_tags = {
            theme = "ivy"
        },
        git_files = {
            theme = "ivy"
        },
        commands = {
            theme = "ivy"
        },
        buffers = {
            theme = "ivy",
            mappings = {
                i = {
                    ["<c-d>"] = actions.delete_buffer + actions.move_to_top,
                },
            },
        },
    },
    extensions = {
        ["ui-select"] = {
            require("telescope.themes").get_ivy(),
        },
    },
})
-- Enable Telescope extensions if they are installed
pcall(require("telescope").load_extension, "fzf")
pcall(require("telescope").load_extension, "ui-select")

-- NOTE: test
-- See `:help telescope.builtin`
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "[S]earch [H]elp" })
vim.keymap.set("n", "<leader>su", builtin.symbols, { desc = "[S]earch [U]nicode" })
vim.keymap.set("n", "<leader>sk", builtin.keymaps, { desc = "[S]earch [K]eymaps" })
vim.keymap.set("n", "<leader>.", builtin.find_files, { desc = "[S]earch [F]iles" })
vim.keymap.set("n", "<C-p>", builtin.git_files, { desc = "[S]earch [F]iles" })
vim.keymap.set("n", "<leader>sw", builtin.grep_string, { desc = "[S]earch current [W]ord" })
vim.keymap.set("n", "<leader>sg", builtin.live_grep, { desc = "[S]earch by [G]rep" })
vim.keymap.set("n", "<leader>st",
    function() builtin.grep_string({ shorten_path = true, word_match = "-w", only_sort_text = true, search = 'TODO:' }) end,
    { desc = "[S]earch [T]odo" })
vim.keymap.set("n", "<leader>sd", builtin.diagnostics, { desc = "[S]earch [D]iagnostics" })
vim.keymap.set("n", "<leader>sr", builtin.resume, { desc = "[S]earch [R]esume" })
vim.keymap.set("n", "<leader>s.", builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
vim.keymap.set("n", "<leader><leader>", builtin.buffers, { desc = "[ ] Find existing buffers" })
vim.keymap.set('n', '<M-x>', builtin.commands, { desc = '[S]earch [C]ommands' })

-- Slightly advanced example of overriding default behavior and theme
vim.keymap.set("n", "<leader>/", function()
    -- You can pass additional configuration to Telescope to change the theme, layout, etc.
    builtin.current_buffer_fuzzy_find(require("telescope.themes").get_ivy({
        previewer = false,
    }))
end, { desc = "[/] Fuzzily search in current buffer" })

-- It's also possible to pass additional configuration options.
--  See `:help telescope.builtin.live_grep()` for information about particular keys
vim.keymap.set("n", "<leader>s/", function()
    builtin.live_grep(require("telescope.themes").get_ivy({
        grep_open_files = true,
        prompt_title = "Live Grep in Open Files",
    }))
end, { desc = "[S]earch [/] in Open Files" })

-- Shortcut for searching your Neovim configuration files
vim.keymap.set("n", "<leader>sn", function()
    builtin.find_files({ cwd = vim.fn.stdpath("config") })
end, { desc = "[S]earch [N]eovim files" })

vim.keymap.set("n", "gd", function() require("telescope.builtin").lsp_definitions() end, { desc = "[G]oto [D]efinition" })
vim.keymap.set("n", "gr", function() require("telescope.builtin").lsp_references() end, { desc = "[G]oto [R]eferences" })
vim.keymap.set("n", "gi", function() require("telescope.builtin").lsp_implementations() end,
    { desc = "[G]oto [I]mplementation" })
vim.keymap.set("n", "<leader>D", function() require("telescope.builtin").lsp_type_definitions() end,
    { desc = "Type [D]efinition" })
vim.keymap.set("n", "gt", function() require("telescope.builtin").lsp_type_definitions() end,
    { desc = "Type [D]efinition" })
vim.keymap.set("n", "<leader>ds", function() require("telescope.builtin").lsp_document_symbols() end,
    { desc = "[D]ocument [S]ymbols" })
vim.keymap.set("n", "<leader>ss", function() require("telescope.builtin").lsp_document_symbols() end,
    { desc = "[S]earch [S]ymobls" })
vim.keymap.set("n", "<leader>sS", function() require("telescope.builtin").lsp_workspace_symbols() end,
    { desc = "[S]earch [S]ymobls" })
