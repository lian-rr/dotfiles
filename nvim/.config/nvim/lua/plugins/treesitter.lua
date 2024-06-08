return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            require("nvim-treesitter.configs").setup({
                auto_install = true,
                ensure_installed = {
                    "c",
                    "lua",
                    "go",
                    "sql",
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
