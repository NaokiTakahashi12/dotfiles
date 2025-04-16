return {
  {
    'neovim/nvim-lspconfig',
    -- version = 'v1.1.0',  -- for neovim 0.9.5
    version = 'v2.0.0',
    dependencies = {
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
    },
    config = function()
      require('mason').setup({})

      local lspconfig = require 'lspconfig'

      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

      -- NOTE: lua_ls has custom settings below, so omitted from general servers
      local servers = {
        'clangd',
        'rust_analyzer',
        'ruff',
        'cmake',
        'jedi_language_server',
        'opencl_ls',
      }
      local on_attach = function(client, bufnr)
        local opts = { buffer = bufnr, noremap = true, silent = true }
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
      end

      require('mason-lspconfig').setup { ensure_installed = servers }
      for _, lsp in ipairs(servers) do
        lspconfig[lsp].setup {
          on_attach = on_attach,
          capabilities = capabilities,
        }
      end
      lspconfig.lua_ls.setup {
        on_attach = on_attach,
        capabilities = capabilities,
        settings = {
          Lua = {
            completion = {
              callSnippet = 'Replace',
            },
            diagnostics = {
              globals = {
                'vim',
              },
            },
          },
        },
      }
    end,
  },
}
