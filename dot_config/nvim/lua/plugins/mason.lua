require('mason').setup()

local capabilities = require('cmp_nvim_lsp').default_capabilities()
local mason_lspconfig = require("mason-lspconfig")
local servers = {
  solargraph = {},
}

mason_lspconfig.setup {
  ensure_installed = vim.tbl_keys(servers),
}

mason_lspconfig.setup_handlers {
  function(server_name)
    require("lspconfig")[server_name].setup {
      capabilities = capabilities,
      on_attach = on_attach,
      settings = servers[server_name],
      filetypes = (servers[server_name] or {}).filetypes,
    }
  end
}
