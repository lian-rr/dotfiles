return {
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
		end,
		opts = {},
		config = function()
			require("which-key").setup()
			vim.keymap.set("n", "<leader>wk", function()
				vim.cmd("WhichKey")
			end, { desc = "Toggle wich key" })
		end,
	},
}
