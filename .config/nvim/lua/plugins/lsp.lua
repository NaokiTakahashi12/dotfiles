return {
  {
    "neovim/nvim-lspconfig",
    version = "v1.1.0", -- for neovim v0.9.5
    dependencies = {
      {
        "williamboman/mason.nvim",
        version = "1.11.0",
      },
      {
        "williamboman/mason-lspconfig.nvim",
        version = "1.32.0",
      },
      {
        "hrsh7th/cmp-nvim-lsp",
      },
    },
    config = function()
      local servers = {
        clangd = {},
        rust_analyzer = {},
        ruff = {},
        lua_ls = {
          settings = {
            Lua = {
              completion = {
                callSnippet = "Replace",
              },
              diagnostics = {
                globals = { "vim" },
              },
            },
          },
        },
        cmake = {},
        jedi_language_server = {},
        opencl_ls = {},
        arduino_language_server = {},
        harper_ls = {},
      }
      require("mason").setup({})
      require("mason-lspconfig").setup({
        ensure_installed = {
          "clangd",
          "rust_analyzer",
          "ruff",
          "lua_ls",
          "cmake",
          "jedi_language_server",
          "opencl_ls",
          "arduino_language_server",
          "harper_ls",
        },
      })
      local lspconfig = require("lspconfig")
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)
      local on_attach = function(client, bufnr)
        local opts = {
          buffer = bufnr,
          noremap = true,
          silent = true,
        }
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        if client.name == "ruff" then
          client.server_capabilities.hoverProvider = false
        end
      end
      for name, config in pairs(servers) do
        config.capabilities = capabilities
        config.on_attach = on_attach
        lspconfig[name].setup(config)
      end
    end,
  },
}
