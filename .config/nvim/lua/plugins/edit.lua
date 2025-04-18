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
    keys = { '<space>s' },
    config = function()
      require 'nvim-treesitter.configs'.setup {
        ensure_installed = { 'c', 'cpp', 'rust', 'python', 'lua', 'vim', 'markdown' },
      }
      require('treesj').setup {
        use_default_keymaps = false,
        check_syntax_error = true,
        max_join_length = 80,
      }
      vim.keymap.set('n', '<leader>s', require('treesj').toggle)
    end,
  },
  {
    'stevearc/conform.nvim',
    enabled = false,
    version = 'v9.0.0',
    config = function()
      require('conform').setup {
        format_on_save = {
          timeout_ms = 2000,
          lsp_fallback = true,
          quiet = false,
        },
      }
    end,
  },
}
