local capabilities = require("cmp_nvim_lsp").default_capabilities()

return {
    cmd = { "zls" },
    filetype = { "zig" },
    capabilities = capabilities,
    settings = {},
}
