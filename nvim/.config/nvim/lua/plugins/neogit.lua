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

        vim.keymap.set("n", "<leader>gs", neogit.open, { desc = "Git status", silent = true })
        vim.keymap.set("n", "<leader>gp", ":Neogit pull<CR>", { desc = "Git pull", silent = true })
        vim.keymap.set("n", "<leader>gP", ":Neogit push<CR>", { desc = "Git push", silent = true })
        vim.keymap.set("n", "<leader>gb", ":Telescope git_branches<CR>", { desc = "Git branches", silent = true })
        vim.keymap.set("n", "<leader>gv", function()
            if next(require("diffview.lib").views) == nil then
                vim.cmd("DiffviewOpen")
            else
                vim.cmd("DiffviewClose")
            end
        end, { desc = "Git diff view toggle", silent = true })
    end,
}
