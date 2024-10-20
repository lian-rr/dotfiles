return {
    "ray-x/go.nvim",
    dependencies = { -- optional packages
        "ray-x/guihua.lua",
        "neovim/nvim-lspconfig",
        "nvim-treesitter/nvim-treesitter",
    },
    config = function()
        require("go").setup()

        vim.keymap.set("n", "<leader>go", ":GoPkgOutline<CR>", { desc = "Go Package outline", silent = true })
        vim.keymap.set("n", "<leader>gc", ":GoCmt<CR>", { desc = "Go comment", silent = true })
        vim.keymap.set("n", "<leader>ge", ":GoIfErr<CR>", { desc = "Go add if err check", silent = true })
        vim.keymap.set("n", "<leader>ctr", ":GoCoverage<CR>", { desc = "Code coverage run", silent = true })
        vim.keymap.set("n", "<leader>ctt", ":GoCoverage -f<CR>", { desc = "Code coverage toggle", silent = true })
    end,
    event = { "CmdlineEnter" },
    ft = { "go", "gomod" },
    build = ':lua require("go.install").update_all_sync()', -- if you need to install/update all binaries
}
