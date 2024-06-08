return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "williamboman/mason.nvim",
        "hrsh7th/cmp-nvim-lsp",
        { "antosha417/nvim-lsp-file-operations", config = true },
        { "folke/neodev.nvim",                   opts = {} },
    },
    config = function()
        local lspconfig = require("lspconfig")

        local capabilities = require("cmp_nvim_lsp").default_capabilities()

        -- import mason_lspconfig plugin
        local mason_lspconfig = require("mason-lspconfig")

        mason_lspconfig.setup_handlers({
            -- Lua config
            lspconfig.lua_ls.setup({
                capabilities = capabilities,
            }),

            -- Go config
            lspconfig.gopls.setup(require("plugins.lsp-configs.gopls")),

            -- C/C++
            lspconfig.clangd.setup(require("plugins.lsp-configs.clangd")),
        })

        -- Global mappings.
        -- See `:help vim.diagnostic.*` for documentation on any of the below functions
        vim.keymap.set("n", "<space>e", vim.diagnostic.open_float)
        vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
        vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
        vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist)

        -- Use LspAttach autocommand to only map the following keys
        -- after the language server attaches to the current buffer
        vim.api.nvim_create_autocmd("LspAttach", {
            group = vim.api.nvim_create_augroup("UserLspConfig", {}),
            callback = function(ev)
                -- Enable completion triggered by <c-x><c-o>
                vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

                -- Buffer local mappings.
                -- See `:help vim.lsp.*` for documentation on any of the below functions
                -- local opts = { buffer = ev.buf }

                vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Docs" })

                vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, { desc = "Go to definition" })
                vim.keymap.set("n", "<leader>gD", vim.lsp.buf.declaration, { desc = "Go to declaration" })
                vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, { desc = "Find references" })
                vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "Code action" })
                vim.keymap.set("n", "<leader>gi", vim.lsp.buf.implementation, { desc = "Go to implementation" })
                vim.keymap.set(
                    "n",
                    "<leader>gt",
                    "<cmd>Telescope lsp_type_definitions<CR>",
                    { desc = "Go to type definition" }
                )

                vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename" })
                vim.keymap.set("n", "<space>cf", function()
                    vim.lsp.buf.format({ async = true })
                end, { desc = "Auto format", buffer = ev.buf })

                vim.keymap.set(
                    "n",
                    "<leader>gD",
                    "<cmd>Telescope diagnostics bufnr=0<CR>",
                    { desc = "Show buffer diagnostics" }
                )
            end,
        })
    end,
}
