local capabilities = require("cmp_nvim_lsp").default_capabilities()

return {
    capabilities = capabilities,
    filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },
}
