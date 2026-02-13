local capabilities = require("cmp_nvim_lsp").default_capabilities()

return {
	cmd = { "templ", "lsp" },
	filetypes = { "templ" },
	root_markers = { "go.work", "go.mod" },
	capabilities = capabilities,
}
