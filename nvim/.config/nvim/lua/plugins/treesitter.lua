return {
	{
		"nvim-treesitter/nvim-treesitter",
		lazy = false,
		build = ":TSUpdate",
		config = function()
			require("nvim-treesitter").setup({
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
					"templ",
				},
				auto_install = true,
				highlight = {
					enable = true,
					use_languagetree = true,
				},
				indent = { enable = true },
			})
		end,
		init = function()
			-- Auto-start treesitter on file open
			vim.api.nvim_create_autocmd({ "BufReadPost", "BufNewFile" }, {
				callback = function()
					vim.treesitter.start()
				end,
			})
		end,
	},
}
