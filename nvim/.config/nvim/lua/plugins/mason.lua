return {
  -- "williamboman/mason.nvim",
  {"mason-org/mason-lspconfig.nvim", version = "1.32.0"},
  {"mason-org/mason.nvim",
  version = "1.11.0",
  dependencies = {
    -- "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-nvim-lsp",
  },
  config = function()
    local mason = require("mason")
    mason.setup()
    local mason_lspconfig = require("mason-lspconfig")
    mason_lspconfig.setup({
      ensure_installed = {
        "lua_ls",
        "pylsp",
        "rust_analyzer",
        "clangd",
        "tailwindcss",
      },
    })
  end,
}
}
