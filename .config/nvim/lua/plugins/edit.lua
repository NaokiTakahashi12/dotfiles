return {
  {
    'monaqa/dial.nvim',
    -- version = 'v0.4.0',
    dependencies = {
      'nvim-lua/plenary.nvim'
    },
    config = function()
      local augend = require('dial.augend')
      require('dial.config').augends:register_group {
        default = {
          augend.integer.alias.decimal,
          augend.integer.alias.hex,
          augend.integer.alias.binary,
          augend.date.alias['%Y/%m/%d'],
          augend.constant.alias.bool,
          augend.semver.alias.semver,
        },
        visual = {
          augend.integer.alias.decimal,
          augend.integer.alias.hex,
          augend.integer.alias.binary,
          augend.date.alias['%Y/%m/%d'],
          augend.constant.alias.alpha,
          augend.constant.alias.Alpha,
          augend.semver.alias.semver,
        },
      }
      vim.keymap.set('n', '<C-a>', function()
        require('dial.map').manipulate('increment', 'normal')
      end)
      vim.keymap.set('n', '<C-x>', function()
        require('dial.map').manipulate('decrement', 'normal')
      end)
      vim.keymap.set('n', 'g<C-a>', function()
        require('dial.map').manipulate('increment', 'gnormal')
      end)
      vim.keymap.set('n', 'g<C-x>', function()
        require('dial.map').manipulate('decrement', 'gnormal')
      end)
      vim.keymap.set('v', '<C-a>', function()
        require('dial.map').manipulate('increment', 'visual')
      end)
      vim.keymap.set('v', '<C-x>', function()
        require('dial.map').manipulate('decrement', 'visual')
      end)
      vim.keymap.set('v', 'g<C-a>', function()
        require('dial.map').manipulate('increment', 'gvisual')
      end)
      vim.keymap.set('v', 'g<C-x>', function()
        require('dial.map').manipulate('decrement', 'gvisual')
      end)
    end
  },
  {
    'echasnovski/mini.pairs',
    dependencies = {
      {
        'echasnovski/mini.nvim',
        version = 'v0.15.0',
      },
      {
        'echasnovski/mini.comment',
        version = 'v0.15.0',
      },
    },
    version = 'v0.15.0',
    config = function()
      require('mini.pairs').setup({})
    end
  },
  {
    'Wansmer/treesj',
    dependencies = {
      'nvim-treesitter/nvim-treesitter'
    },
    keys = { '<space>fm' },
    config = function()
      require('treesj').setup {
        use_default_keymaps = false,
        check_syntax_error = true,
        max_join_length = 80,
      }
      vim.keymap.set('n', '<leader>fm', require('treesj').toggle)
    end,
  },
  {
    'stevearc/conform.nvim',
    enabled = true,
    version = 'v9.0.0',
    -- version = 'v7.1.0', -- for neovim v0.9.5
    opts = {
      format_on_save = {
        timeout_ms = 2000,
        quiet = false,
        lsp_fallback = true,
      },
      formatters_by_ft = {
        c = { 'clang-format' },
        cpp = { 'clang-format' },
      }
    },
  },
  {
    'p00f/clangd_extensions.nvim',
    config = function()
      require('clangd_extensions').setup {
        ast = {
          role_icons = {
            type = "🄣",
            declaration = "🄓",
            expression = "🄔",
            statement = ";",
            specifier = "🄢",
            ["template argument"] = "🆃",
          },
          kind_icons = {
            Compound = "🄲",
            Recovery = "🅁",
            TranslationUnit = "🅄",
            PackExpansion = "🄿",
            TemplateTypeParm = "🅃",
            TemplateTemplateParm = "🅃",
            TemplateParamObject = "🅃",
          },
        },
      }
    end,
  }
}
