return {
    "vim-test/vim-test",
    dependencies = {
        "preservim/vimux",
    },
    config = function()
        vim.keymap.set("n", "<leader>tt", ":TestNearest<CR>", { silent = true, desc = "Test Nearest" })
        vim.keymap.set("n", "<leader>tT", ":TestFile<CR>", { silent = true, desc = "Test File" })
        vim.keymap.set("n", "<leader>ta", ":TestSuite<CR>", { silent = true, desc = "Test Suite" })
        vim.keymap.set("n", "<leader>tl", ":TestLast<CR>", { silent = true, desc = "Test Last" })
        vim.keymap.set("n", "<leader>tg", ":TestVisit<CR>", { silent = true, desc = "Test Visit" })
        -- run in lower pane
        -- vim.cmd("let test#strategy = 'vimux'")
    end,
}
