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
        -- LSP Servers
        local servers = {
            "lua_ls", -- Lua
            "gopls", -- Go
            "clangd", -- C/C++
            "ts_ls", -- JS/TS
            "tailwindcss", -- Tailwind
            "jsonls", --JSON
            "zls", -- Zig
            "nil_ls", --Nix
        }

        for _, server in ipairs(servers) do
            vim.lsp.config(server, require(string.format("plugins.lsp-configs.%s", server)))
        end

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
                vim.keymap.set("n", "<leader>gr", "<cmd>Telescope lsp_references<CR>", { desc = "Find references" })
                vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "Code action" })
                vim.keymap.set(
                    "n",
                    "<leader>gi",
                    "<cmd>Telescope lsp_implementations<CR>",
                    { desc = "Go to implementation" }
                )
                vim.keymap.set(
                    "n",
                    "<leader>gt",
                    "<cmd>Telescope lsp_type_definitions<CR>",
                    { desc = "Go to type definition" }
                )

                vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename", silent = true })
                vim.keymap.set("n", "<space>fm", function()
                    vim.lsp.buf.format({ async = true })
                end, { desc = "Auto format", buffer = ev.buf, silent = true })

                vim.keymap.set(
                    "n",
                    "<leader>gD",
                    "<cmd>Telescope diagnostics bufnr=0<CR>",
                    { desc = "Show buffer diagnostics", silent = true }
                )
            end,
        })
    end,
}
