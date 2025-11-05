return {
  {
    'neovim/nvim-lspconfig',
    dependencies = { 'saghen/blink.cmp' },


    config = function()
      local capabilities = require('blink.cmp').get_lsp_capabilities()

      local keymap = vim.keymap
      local opts = { noremap = true, silent = true }
      local on_attach = function(client, bufnr)
        require("lsp-format").on_attach(client, bufnr)
        opts.buffer = bufnr
        opts.desc = "Show LSP references"
        keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts) -- show definition, references

        opts.desc = "Go to declaration"
        keymap.set("n", "gD", vim.lsp.buf.declaration, opts) -- go to declaration

        opts.desc = "toggle between source and header"
        keymap.set("n", "<leader>c", "<cmd>ClangdSwitchSourceHeader<CR>", opts) -- go to declaration

        opts.desc = "Show LSP definitions"
        keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts) -- show lsp definitions

        opts.desc = "Show LSP implementations"
        keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts) -- show lsp implementations

        opts.desc = "Show LSP type definitions"
        keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts) -- show lsp type definitions

        opts.desc = "See available code actions"
        keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection

        opts.desc = "Smart rename"
        keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- smart rename

        opts.desc = "Show buffer diagnostics"
        keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- show  diagnostics for file

        opts.desc = "Show line diagnostics"
        keymap.set("n", "<leader>D", vim.diagnostic.open_float, opts) -- show diagnostics for line

        opts.desc = "Go to previous diagnostic"
        keymap.set("n", "[d", vim.diagnostic.goto_prev, opts) -- jump to previous diagnostic in buffer

        opts.desc = "Go to next diagnostic"
        keymap.set("n", "]d", vim.diagnostic.goto_next, opts) -- jump to next diagnostic in buffer

        opts.desc = "Show documentation for what is under cursor"
        keymap.set("n", "K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor

        opts.desc = "Restart LSP"
        keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary
      end


      -- Configure each language server using vim.lsp.config
      vim.lsp.config('lua_ls', {
        capabilities = capabilities,
        on_attach = on_attach,
      })

      vim.lsp.config('basedpyright', {
        capabilities = capabilities,
        on_attach = on_attach,
        root_dir = function()
          return vim.fn.getcwd()
        end,
        settings = {
          basedpyright = {
            analysis = {
              diagnosticSeverityOverrides = {
                reportUnknownVariableType = "none",
                reportUnknownParameterType = "none",
                reportUnknownMemberType = "none",
                reportMissingTypeStubs = "none",
                reportUnknownArgumentType = "none",
                reportGeneralTypeIssues = "none",
                reportUnusedExpression = "none",
              }
            },
          },
        }
      })

      vim.lsp.config('rust_analyzer', {
        capabilities = capabilities,
        on_attach = on_attach,
        settings = {
          ['rust-analyzer'] = {
            check = {
              command = "clippy"
            }
          }
        }
      })

      vim.lsp.config('gopls', {
        capabilities = capabilities,
        on_attach = on_attach,
      })

      vim.lsp.config('jdtls', {
        cmd = { "jdtls", "--java-executable", "java", "--no-validate-java-version" },
        capabilities = capabilities,
        on_attach = on_attach,
      })

      vim.lsp.config('html', {
        capabilities = capabilities,
        on_attach = on_attach,
      })

      vim.lsp.config('emmet_language_server', {
        capabilities = capabilities,
        on_attach = on_attach,
      })

      vim.lsp.config('awk_ls', {
        capabilities = capabilities,
        on_attach = on_attach,
      })

      vim.lsp.config('tinymist', {
        capabilities = capabilities,
        on_attach = on_attach,
      })

      vim.lsp.config('clangd', {
        capabilities = capabilities,
        on_attach = on_attach,
      })

      -- Enable the configured servers
      vim.lsp.enable({
        'lua_ls',
        'basedpyright',
        'rust_analyzer',
        'gopls',
        'jdtls',
        'html',
        'emmet_language_server',
        'awk_ls',
        'tinymist',
        'clangd',
      })
    end,
  }
}
