local capabilities = require("cmp_nvim_lsp").default_capabilities()

return {
    capabilities = capabilities,
    settings = {
        Lua = {
            runtime = {
                version = "LuaJIT",
            },
            diagnostics = {
                globals = {
                    "vim",
                    "require",
                },
            },
        },
    },
}
