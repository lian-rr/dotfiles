return {
    {
        'nvim-telescope/telescope-ui-select.nvim',
    },
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.5',
        dependencies = {
            'nvim-lua/plenary.nvim',
            "debugloop/telescope-undo.nvim",
        },
        config = function()
            local telescope = require('telescope')

            telescope.setup({
                extensions = {
                    ['ui-select'] = {
                        require('telescope.themes').get_dropdown({}),
                    },
                    ['undo'] = {},
                },
            })

            telescope.load_extension('ui-select')
            telescope.load_extension('undo')

            -- See `:help telescope.builtin`
            local builtin = require('telescope.builtin')

            vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Find files' })
            vim.keymap.set('n', '<leader>fa', builtin.find_files, { desc = 'Find in all files' })
            vim.keymap.set('n', '<leader>fo', builtin.oldfiles, { desc = 'Find recently opened files' })
            vim.keymap.set('n', '<leader>ff', builtin.buffers, { desc = 'Find existing buffers' })
            vim.keymap.set('n', '<leader>fg', builtin.git_files, { desc = 'Search Git Files' })


            vim.keymap.set('n', '<leader>/', function()
                -- You can pass additional configuration to telescope to change theme, layout, etc.
                builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
                    winblend = 10,
                    previewer = false,
                })
            end, { desc = 'Fuzzily search in current buffer' })

            vim.keymap.set('n', '<leader>s/', function()
                builtin.live_grep {
                    grep_open_files = true,
                    prompt_title = 'Live Grep in Open Files',
                }
            end, { desc = 'Search in Open Files' })

            vim.keymap.set('n', '<leader>u', '<cmd>Telescope undo<cr>', { desc = 'Telescope undo history' })
        end
    },
}
