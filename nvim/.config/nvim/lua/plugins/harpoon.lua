return {
    "ThePrimeagen/harpoon",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope.nvim",
    },
    config = function()
        local harpoon = require("harpoon")
        local harpoon_ui = require("harpoon.ui")
        local harpoon_mark = require("harpoon.mark")

        harpoon.setup({})
        require("telescope").load_extension("harpoon")

        -- Add mark
        vim.keymap.set("n", "<leader>ha", function()
            harpoon_mark.add_file()
        end, { desc = "Harpoon add file" })

        -- Quick menu
        vim.keymap.set("n", "<leader>hm", function()
            harpoon_ui.toggle_quick_menu()
        end, { desc = "Harpoon quick menu" })

        -- Full menu
        vim.keymap.set("n", "<leader><C-m>", ":Telescope harpoon marks<CR>", { desc = "Harpoon menu" })

        -- Next and previous
        vim.keymap.set("n", "<leader>hn", function()
            harpoon_ui.nav_next()
        end, { desc = "Harpoon next" })

        vim.keymap.set("n", "<leader>hp", function()
            harpoon_ui.nav_prev()
        end, { desc = "Harpoon previous" })

        -- Harpoon quick nav
        vim.keymap.set("n", "<leader>hf", function()
            harpoon_ui.nav_file(1)
        end, { desc = "Harpoon mark 1" })
        vim.keymap.set("n", "<leader>hj", function()
            harpoon_ui.nav_file(2)
        end, { desc = "Harpoon mark 2" })
        vim.keymap.set("n", "<leader>hd", function()
            harpoon_ui.nav_file(3)
        end, { desc = "Harpoon mark 3" })
        vim.keymap.set("n", "<leader>hk", function()
            harpoon_ui.nav_file(4)
        end, { desc = "Harpoon mark 4" })

        -- Harpoon replace at position
        vim.keymap.set("n", "<leader>hrf", function()
            harpoon_mark.set_current_at(1)
        end, { desc = "Harpoon set mark 1" })
        vim.keymap.set("n", "<leader>hrj", function()
            harpoon_mark.set_current_at(2)
        end, { desc = "Harpoon set mark 2" })
        vim.keymap.set("n", "<leader>hrd", function()
            harpoon_mark.set_current_at(3)
        end, { desc = "Harpoon set mark 3" })
        vim.keymap.set("n", "<leader>hrk", function()
            harpoon_mark.set_current_at(4)
        end, { desc = "Harpoon set mark 4" })
    end,
}
