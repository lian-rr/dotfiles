return {
    "NeogitOrg/neogit",
    dependencies = {
        "nvim-lua/plenary.nvim", -- required
        "sindrets/diffview.nvim", -- optional - Diff integration
        "nvim-telescope/telescope.nvim",
    },
    config = function()
        local neogit = require("neogit")
        neogit.setup({})

        vim.keymap.set("n", "<leader>gs", neogit.open, { desc = "Git status" })
        vim.keymap.set("n", "<leader>gc", ":Neogit commit<CR>", { desc = "Git commit" })
        vim.keymap.set("n", "<leader>gp", ":Neogit pull<CR>", { desc = "Git pull" })
        vim.keymap.set("n", "<leader>gP", ":Neogit push<CR>", { desc = "Git push" })
        vim.keymap.set("n", "<leader>gb", ":Telescope git_branches<CR>", { desc = "Git branches" })
        vim.keymap.set("n", "<leader>gv", function()
            if next(require("diffview.lib").views) == nil then
                vim.cmd("DiffviewOpen")
            else
                vim.cmd("DiffviewClose")
            end
        end, { desc = "Git diff view toggle" })
    end,
}
