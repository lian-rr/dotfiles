local capabilities = require("cmp_nvim_lsp").default_capabilities()

return {
    cmd = { "buf format" },
    -- filetype = { "proto" },
    capabilities = capabilities,
    settings = {},
}
