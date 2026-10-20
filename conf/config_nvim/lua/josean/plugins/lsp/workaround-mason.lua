-- Pin Mason to v1: lspconfig.lua uses mason_lspconfig.setup_handlers, removed in v2
return {
  { "mason-org/mason.nvim", version = "^1.0.0" },
  { "mason-org/mason-lspconfig.nvim", version = "^1.0.0" },
}
