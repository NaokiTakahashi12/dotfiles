return {
  {
    'lewis6991/gitsigns.nvim',
    version = 'v1.0.2',
    config = function()
      require('gitsigns').setup({})
    end,
  },
  {
    'kevinhwang91/nvim-hlslens',
    version = 'v1.1.0',
    config = function()
      require('hlslens').setup({})
    end,
  },
  {
    'j-hui/fidget.nvim',
    version = 'v1.6.1',
    config = function()
      require('fidget').setup {
        progress = {
          display = {
          },
        },
      }
      vim.notify = require("fidget.notification").notify
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    event = "CursorMoved",
  },
  {
    "nvim-treesitter/nvim-treesitter",
    -- version = "v0.9.3", -- for neovim v0.9.5
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
    },
    build = ":TSUpdate",
    main = "nvim-treesitter.configs",
    config = function()
      require('nvim-treesitter.configs').setup {
        ensure_installed = { 'c', 'cpp', 'rust', 'python', 'lua', 'vim', 'markdown' },
        highlight = {
          enabled = true,
        }
      }
    end,
  },
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {
      modes = {
        search = {
          enabled = false,
        },
        char = {
          enabled = true,
          jump_labels = true,
          multi_line = true,
        },
      },
      jump = {
        autojump = false,
      },
      label = {
        uppercase = false,
        rainbow = {
          enabled = false,
        },
      },
    },
    keys = {
      {
        "s",
        mode = { "n", "x", "o" },
        function()
          require("flash").jump()
        end,
        desc = "Flash jump",
      },
      {
        "S",
        mode = { "n", "x", "o" },
        function()
          require("flash").jump({
            search = {
              mode = "search",
              max_length = 0,
            },
            label = {
              after = { 0, 0 },
            },
            pattern = "^",
          })
        end,
        desc = "Flash jump line start",
      },
      {
        "f",
        mode = { "n", "x", "o" },
        function()
          require("flash").jump({
            mode = "char",
            search = { forward = true, wrap = false, multi_line = false },
          })
        end,
        desc = "Flash forward char",
      },
      {
        "F",
        mode = { "n", "x", "o" },
        function()
          require("flash").jump({
            mode = "char",
            search = { forward = false, wrap = false, multi_line = false },
          })
        end,
        desc = "Flash backward char",
      },
      {
        "t",
        mode = { "n", "x", "o" },
        function()
          require("flash").jump({
            mode = "char",
            search = { forward = true, wrap = false, multi_line = false },
            jump = { offset = -1 },
          })
        end,
        desc = "Flash till forward char",
      },
      {
        "T",
        mode = { "n", "x", "o" },
        function()
          require("flash").jump({
            mode = "char",
            search = { forward = false, wrap = false, multi_line = false },
            jump = { offset = 1 },
          })
        end,
        desc = "Flash till backward char",
      },
    },
  },
  {
    "folke/trouble.nvim",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
    },
    opts = {},
    cmd = "Trouble",
    config = function()
      require("trouble").setup {
      }
    end,
  },
  {
    "dhananjaylatkar/cscope_maps.nvim",
    opts = {},
    config = function()
      require("cscope_maps").setup {
      }
    end,
  },
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    config = function()
      require("telescope").setup {
      }
      local builtin = require('telescope.builtin')
      vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
      vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
      vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
      vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
    end,
  },
  {
    "folke/todo-comments.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      require("todo-comments").setup {
      }
    end,
  },
  {
    "preservim/tagbar",
    cmd = { "TagbarToggle", "TagbarOpen", "TagbarClose" },
    keys = {
      { "<leader>c", "<cmd>TagbarToggle<CR>", desc = "Toggle Tagbar" },
    },
    init = function()
      vim.g.tagbar_width = 40
      vim.g.tagbar_sort = 0
      vim.g.tagbar_autofocus = 1
    end,
  }
}
