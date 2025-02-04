vim.keymap.set("n", "<space><space>x", "<cmd>source %<CR>")
vim.keymap.set("n", "<space>x", ":.lua<CR>")
vim.keymap.set("v", "<space>x", ":lua<CR>")
vim.keymap.set("x", "<leader>pp", [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])
vim.keymap.set("n", "<leader>cw", [["_yiw:s/\(\%#\w\+\)\(\W\+\)\(\w\+\)/\3\2\1/<CR><c-o><c-l>]],
    { desc = "Change word right" })
vim.keymap.set("n", "<leader>cW", [["_yiw?\w\+\_W\+\%#<CR>:s/\(\%#\w\+\)\(\_W\+\)\(\w\+\)/\3\2\1/<CR><c-o><c-l>]],
    { desc = "Change word right" })

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
-- Diagnostic keymaps
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic [E]rror messages" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })
vim.keymap.set("n", "<leader>w", vim.cmd.write, { desc = "Write File" })
vim.keymap.set("n", "<leader>W", ":wq <CR>", { desc = "Write and quit" })
vim.keymap.set("n", "<leader>vs", ":vs<CR>", { desc = "[V]ertical [S]plit" })
vim.keymap.set("n", "\\", ":vs<CR>", { desc = "[V]ertical [S]plit" })
vim.keymap.set("n", "<leader>dw", ":wincmd q<CR>", { desc = "[D]elete [W]indow" })
-- vim.keymap.set("n", "<C-j>", ":wincmd j<CR>", { desc = "[D]elete [W]indow" })
-- vim.keymap.set("n", "<C-h>", ":wincmd h<CR>", { desc = "[D]elete [W]indow" })
-- vim.keymap.set("n", "<C-l>", ":wincmd l<CR>", { desc = "[D]elete [W]indow" })
-- vim.keymap.set("n", "<C-k>", ":wincmd k<CR>", { desc = "[D]elete [W]indow" })
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<leader>n", "<cmd>cnext<CR>zz", { desc = "cnext" })
vim.keymap.set("n", "<leader>p", "<cmd>cprev<CR>zz", { desc = "cprev" })
vim.keymap.set("n", "<leader>gs", function()
    require("neogit").open({ kind = "split" })
end, { desc = "[G]it [S]tatus" })
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- TIP: Disable arrow keys in normal mode
vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<leader>rc", function()
    vim.ui.input({
            prompt = 'Enter command: '
        },
        function(input)
            vim.api.nvim_command(":! " .. input)
        end)
end, { desc = "[R]un [C]ommand" })
