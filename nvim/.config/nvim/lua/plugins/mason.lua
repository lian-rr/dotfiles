return {
    {
        "williamboman/mason.nvim",
        dependencies = {
            "williamboman/mason-lspconfig.nvim",
            "WhoIsSethDaniel/mason-tool-installer.nvim",
        },
        cmd = { "Mason", "MasonInstall", "MasonInstallAll", "MasonUpdate" },
        config = function()
            require("mason").setup({
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

            require("mason-tool-installer").setup({
                ensure_installed = {
                    "stylua",
                    "delve", -- go debugger
                    "golangci-lint", -- go linter
                    "gofumpt", -- go formatter
                    "goimports-reviser", -- go auto imports
                    "golines", -- go format long lines
                    "shellcheck",
                    "misspell",
                    "gomodifytags", -- generate tags for structs
                    "impl", -- gen methods for implementing interface
                    "clang-format",
                },
            })
        end,
    },
}
