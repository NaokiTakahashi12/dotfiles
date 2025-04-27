return {
  {
    'neovim/nvim-lspconfig',
    -- version = 'v1.1.0', -- for neovim v0.9.5
    version = 'v2.0.0',
    dependencies = {
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
    },
    config = function()
      local servers = {
        'clangd',
        'rust_analyzer',
        'ruff',
        'lua_ls',
        'cmake',
        'jedi_language_server',
        'opencl_ls',
        'arduino_language_server',
        'harper_ls',
      }

      require('mason').setup({})
      require('mason-lspconfig').setup {
        ensure_installed = servers,
      }
      local lspconfig = require 'lspconfig'
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

      for _, lsp in ipairs(servers) do
        lspconfig[lsp].setup {
          on_attach = function(_, bufnr)
            local opts = {
              buffer = bufnr,
              noremap = true,
              silent = true,
            }
            vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
            vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
          end,
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
      end
    end,
  },
}
