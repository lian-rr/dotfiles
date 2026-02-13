return {
	cmd = { "gopls" },
	filetypes = { "go", "gomod", "gowork", "gotmpl" },
	settings = {
		gopls = {
			semanticTokens = true,
			completeUnimported = true,
			usePlaceholders = true,
			staticcheck = true,
			gofumpt = true,
			analyses = {
				unusedparams = true,
				unusedwrite = true,
				useany = true,
			},
			hints = {
				enable = true,
				-- assignVariableTypes = true,
				compositeLiteralFields = true,
				compositeLiteralTypes = true,
				constantValues = true,
				functionTypeParameters = true,
				parameterNames = true,
				-- rangeVariableTypes = true,
			},
		},
	},
}
