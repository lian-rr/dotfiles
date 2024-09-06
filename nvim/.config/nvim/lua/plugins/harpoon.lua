return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope.nvim",
    },
    config = function()
        local harpoon = require("harpoon")
        harpoon:setup({})

        -- Add mark
        vim.keymap.set("n", "<leader>ha", function()
            harpoon:list():add()
        end, { desc = "Harpoon add file" })

        -- Quick menu
        vim.keymap.set("n", "<leader>ht", function()
            harpoon.ui:toggle_quick_menu(harpoon:list())
        end, { desc = "Harpoon quick menu" })

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
        vim.keymap.set("n", "<leader>hj", function()
            harpoon:list():select(3)
        end, { desc = "Harpoon mark 3" })
        vim.keymap.set("n", "<leader>hk", function()
            harpoon:list():select(4)
        end, { desc = "Harpoon mark 4" })

        -- basic telescope configuration
        local conf = require("telescope.config").values
        local function toggle_telescope(harpoon_files)
            local file_paths = {}
            for _, item in ipairs(harpoon_files.items) do
                table.insert(file_paths, item.value)
            end

            require("telescope.pickers")
                .new({}, {
                    prompt_title = "Harpoon",
                    finder = require("telescope.finders").new_table({
                        results = file_paths,
                    }),
                    previewer = conf.file_previewer({}),
                    sorter = conf.generic_sorter({}),
                })
                :find()
        end

        vim.keymap.set("n", "<C-e>", function()
            toggle_telescope(harpoon:list())
        end, { desc = "Open harpoon window" })
    end,
}
