local capabilities = require("cmp_nvim_lsp").default_capabilities()

return {
    filetype = { "nix" },
    capabilities = capabilities,
    settings = {
        ["nil"] = {
            formatter = { command = { "nixpkgs-fmt" } },
        },
    },
}
