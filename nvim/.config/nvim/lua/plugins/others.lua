return {
    -- "gc" to comment visual regions/lines
    {
        "numToStr/Comment.nvim",
        config = function()
            require("Comment").setup()
        end,
    },
    {
        "s1n7ax/nvim-window-picker",
        name = "window-picker",
        event = "VeryLazy",
        version = "2.*",
        config = function()
            require("window-picker").setup()
        end,
    },
    {
        "kylechui/nvim-surround",
        event = { "BufReadPre", "BufNewFile" },
        version = "*", -- Use for stability; omit to use `main` branch for the latest features
        config = true,
    },
    {
        "Wansmer/treesj",
        dependencies = { "nvim-treesitter/nvim-treesitter" },
        config = function()
            require("treesj").setup({
                --[[ your config ]]
            })

            vim.keymap.set({ "n", "v" }, "<leader>j", ":TSJToggl<CR>", { desc = "Toggle join lines" })
        end,
    },
}
