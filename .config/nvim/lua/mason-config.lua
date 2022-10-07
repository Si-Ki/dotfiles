require("mason").setup({
  ui = {
    icons = {
      package_installed = "",
      package_pending = "",
      package_uninstalled = "ﮊ",
    }
  }
})

require("mason-lspconfig").setup {
    ensure_installed = { "sumneko_lua" },
}

local capabilities = vim.lsp.protocol.make_client_capabilities()
