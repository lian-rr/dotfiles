local capabilities = require("cmp_nvim_lsp").default_capabilities()

return {
    cmd = { "gopls" },
    filetypes = { "go", "gomod", "gowork", "gotmpl" },
    capabilities = capabilities,
    settings = {
        gopls = {
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
                -- compositeLiteralFields = true,
                -- compositeLiteralTypes = true,
                -- constantValues = true,
                -- functionTypeParameters = true,
                -- parameterNames = true,
                -- rangeVariableTypes = true,
            },
        },
    },
}
