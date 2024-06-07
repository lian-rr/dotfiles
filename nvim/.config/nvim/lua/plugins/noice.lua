return {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
        "MunifTanjim/nui.nvim",
        "rcarriga/nvim-notify",
    },
    config = function()
        local noice = require("noice")
        noice.setup({})

        local notify = require("notify")

        vim.keymap.set("n", "<leader>nd", notify.dismiss, { desc = "Dismiss notification", silent = true })
        vim.keymap.set("n", "<leader>na", notify.history, { desc = "Open all notifications", silent = true })
    end,
}
