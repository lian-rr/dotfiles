local capabilities = require("cmp_nvim_lsp").default_capabilities()

return {
	cmd = { "gopls" },
	filetypes = { "go", "gomod", "gowork", "gotmpl" },
	capabilities = capabilities,
	settings = {
		gopls = {
			completeUnimported = true,
			usePlaceholders = true,
			analyses = {
				unusedparams = true,
				unusedwrite = true,
				useany = true,
			},
		},
	},
}
