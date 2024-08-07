return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            require("nvim-treesitter.configs").setup({
                ensure_installed = {
                    "c",
                    "cpp",
                    "lua",
                    "go",
                    "sql",
                    "tsx",
                    "javascript",
                    "typescript",
                    "zig",
                },
                auto_install = true,
                highlight = {
                    enable = true,
                    use_languagetree = true,
                },

                indent = { enable = true },
            })
        end,
    },
}
