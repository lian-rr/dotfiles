return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope.nvim",
    },
    config = function()
        local harpoon = require("harpoon")

        harpoon.setup({})

        -- Add mark
        vim.keymap.set("n", "<leader>ha", function()
            harpoon:list():add()
        end, { desc = "Harpoon add file" })

        -- Quick menu
        vim.keymap.set("n", "<leader>hm", function()
            harpoon.ui:toggle_quick_menu(harpoon:list())
        end, { desc = "Harpoon quick menu" })

        -- Full menu
        vim.keymap.set("n", "<leader><C-m>", ":Telescope harpoon marks<CR>", { desc = "Harpoon menu" })

        -- Next and previous
        vim.keymap.set("n", "<leader>hn", function()
            harpoon:list():next()
        end, { desc = "Harpoon next" })

        vim.keymap.set("n", "<leader>hN", function()
            harpoon:list():prev()
        end, { desc = "Harpoon previous" })

        -- Harpoon quick nav
        vim.keymap.set("n", "<leader>hf", function()
            harpoon:list():select(1)
        end, { desc = "Harpoon mark 1" })
        vim.keymap.set("n", "<leader>hd", function()
            harpoon:list():select(2)
        end, { desc = "Harpoon mark 2" })
        vim.keymap.set("n", "<leader>hs", function()
            harpoon:list():select(3)
        end, { desc = "Harpoon mark 3" })
        vim.keymap.set("n", "<leader>ha", function()
            harpoon:list():select(4)
        end, { desc = "Harpoon mark 4" })
    end,
}
