return {
    {
        'williamboman/mason.nvim',
        cmd = { 'Mason', 'MasonInstall', 'MasonInstallAll', 'MasonUpdate' },
        config = function()
            require('mason').setup({
                ui = {
                    icons = {
                        package_pending = " ",
                        package_installed = "󰄳 ",
                        package_uninstalled = " 󰚌",
                    },

                    keymaps = {
                        toggle_server_expand = "<CR>",
                        install_server = "i",
                        update_server = "u",
                        check_server_version = "c",
                        update_all_servers = "U",
                        check_outdated_servers = "C",
                        uninstall_server = "X",
                        cancel_installation = "<C-c>",
                    },
                },

                max_concurrent_installers = 10,
           })
        end
    },
    {
        'williamboman/mason-lspconfig.nvim',
        config = function()
            require('mason-lspconfig').setup({
                ensure_installed = { 'lua_ls' }
            })
        end
    },
    {
        'neovim/nvim-lspconfig',
        config = function()
            local lspconfig = require('lspconfig')

            lspconfig.lua_ls.setup({})

            -- Global mappings.
            -- See `:help vim.diagnostic.*` for documentation on any of the below functions
            vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
            vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
            vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
            vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

            -- Use LspAttach autocommand to only map the following keys
            -- after the language server attaches to the current buffer
            vim.api.nvim_create_autocmd('LspAttach', {
                group = vim.api.nvim_create_augroup('UserLspConfig', {}),
                callback = function(ev)
                    -- Enable completion triggered by <c-x><c-o>
                    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

                    -- Buffer local mappings.
                    -- See `:help vim.lsp.*` for documentation on any of the below functions
                    local opts = { buffer = ev.buf }

                    vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = 'Docs' })

                    vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, { desc = 'Go to definition' })
                    vim.keymap.set("n", "<leader>gD", vim.lsp.buf.declaration, { desc = 'Go to declaration' })
                    vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, { desc = 'Find references' })
                    vim.keymap.set({"n", "v"}, "<leader>ca", vim.lsp.buf.code_action, { desc = 'Code action' })
                    vim.keymap.set("n", "<leader>ci", vim.lsp.buf.implementation, { desc = 'Go to implementation' })

                    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = 'Rename' })
                    vim.keymap.set('n', '<space>f', function()
                        vim.lsp.buf.format { async = true }
                    end, opts)
                end
            })
        end
    },
}
