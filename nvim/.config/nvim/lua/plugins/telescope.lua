return {
    {
        "nvim-telescope/telescope-ui-select.nvim",
    },
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.5",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "debugloop/telescope-undo.nvim",
            { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
            "folke/todo-comments.nvim",
        },
        config = function()
            local telescope = require("telescope")
            local actions = require("telescope.actions")
            local transform_mod = require("telescope.actions.mt").transform_mod

            local trouble = require("trouble")
            local trouble_telescope = require("trouble.providers.telescope")

            -- or create your custom action
            local custom_actions = transform_mod({
                open_trouble_qflist = function(prompt_bufnr)
                    trouble.toggle("quickfix")
                end,
            })

            telescope.setup({
                defaults = {
                    path_displays = { "smart" },
                    mappings = {
                        i = {
                            ["<C-k>"] = actions.move_selection_previous, -- move to prev result
                            ["<C-j>"] = actions.move_selection_next, -- move to next result
                            ["<C-q>"] = actions.send_selected_to_qflist + custom_actions.open_trouble_qflist,
                            ["<C-t>"] = trouble_telescope.smart_open_with_trouble,
                        },
                    },
                },
                extensions = {
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown({}),
                    },
                    ["undo"] = {},
                },
            })

            telescope.load_extension("undo")
            telescope.load_extension("fzf")
            telescope.load_extension("ui-select")

            -- See `:help telescope.builtin`
            local builtin = require("telescope.builtin")

            vim.keymap.set("n", "<leader>ff", builtin.buffers, { desc = "Find existing buffers" })
            vim.keymap.set("n", "<leader>fa", builtin.find_files, { desc = "Find in all files" })
            vim.keymap.set("n", "<leader>fo", builtin.oldfiles, { desc = "Find recently opened files" })
            vim.keymap.set("n", "<leader>fg", builtin.git_files, { desc = "Search Git Files" })
            vim.keymap.set("n", "<leader>fs", builtin.live_grep, { desc = "Find string in cwd" })
            vim.keymap.set("n", "<leader>fd", builtin.diagnostics, { desc = "Search Diagnostics" })
            vim.keymap.set("n", "<leader>fc", builtin.grep_string, { desc = "Find string under cursor in cwd" })
            vim.keymap.set("n", "<leader>u", "<cmd>Telescope undo<cr>", { desc = "Telescope undo history" })

            vim.keymap.set("n", "<leader>/", function()
                -- You can pass additional configuration to telescope to change theme, layout, etc.
                builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
                    winblend = 10,
                    previewer = false,
                }))
            end, { desc = "Fuzzily search in current buffer" })

            vim.keymap.set("n", "<leader>frs", function()
                builtin.live_grep({
                    grep_open_files = true,
                    prompt_title = "Live Grep in Open Files",
                })
            end, { desc = "Search in Open Files" })
        end,
    },
}
