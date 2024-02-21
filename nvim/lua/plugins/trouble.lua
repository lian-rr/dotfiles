return {
	{
		"folke/trouble.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			local trouble = require("trouble")
			trouble.setup({})

			-- Lua
			vim.keymap.set("n", "<leader>xx", function()
				trouble.toggle()
			end, { desc = "Toggle trouble" })
			vim.keymap.set("n", "<leader>xw", function()
				trouble.toggle("workspace_diagnostics")
			end, { desc = "Worskpace diagnostic" })
			vim.keymap.set("n", "<leader>xd", function()
				trouble.toggle("document_diagnostics")
			end, { desc = "Document diagnostic" })
			vim.keymap.set("n", "<leader>xq", function()
				trouble.toggle("quickfix")
			end, { desc = "Toggle quickfix" })
			vim.keymap.set("n", "<leader>xl", function()
				trouble.toggle("loclist")
			end, { desc = "Toggle loclist" })
			vim.keymap.set("n", "gR", function()
				trouble.toggle("lsp_references")
			end, { desc = "Toggle lsp references" })
		end,
	},
}
