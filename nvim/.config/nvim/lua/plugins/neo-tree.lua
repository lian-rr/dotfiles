return {
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim",
            -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
        },
        config = function()
            vim.keymap.set(
                "n",
                "<C-n>",
                ":Neotree filesystem reveal left<CR>",
                { desc = "Open the filetree", silent = true }
            )
            vim.keymap.set(
                "n",
                "<leader>bf",
                ":Neotree buffers reveal float<CR>",
                { desc = "Reveal open buffers in tree", silent = true }
            )

            require("neo-tree").setup({
                filesystem = {
                    filtered_items = {
                        visible = true,
                        show_hidden_count = true,
                        hide_dotfiles = false,
                        hide_gitignored = false,
                        hide_by_name = {
                            ".git",
                            ".DS_Store",
                            -- 'thumbs.db',
                        },
                        never_show = {},
                    },
                },
            })
        end,
    },
}
