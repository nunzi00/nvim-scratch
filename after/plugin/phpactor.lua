local lspconfig = require "lspconfig"
local configs = require "lspconfig.configs"
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
configs.phpactor.setup {
  default_config = {
    cmd = {
      "phpactor",
      "language-server",
    },
    filetypes = { "php" },
    root_dir = {
      "composer.json",
      ".git",
      "../composer.json",
      "../.git",
    },
  },
}

