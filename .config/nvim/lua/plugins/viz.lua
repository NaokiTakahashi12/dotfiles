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
      require('fidget').setup({})
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    -- version = "v0.9.3",  -- for neovim v0.9.5
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
    enabled = false,
    opts = {},
    keys = {
      {
        "s",
        mode = { "n", "x", "o" },
        function() require("flash").jump() end,
        desc = "Flash",
      },
      {
        "S",
        mode = { "n", "x", "o" },
        function() require("flash").treesitter() end,
        desc = "Flash Treesitter",
      },
      {
        "r",
        mode = "o",
        function() require("flash").remote() end,
        desc = "Remote Flash",
      },
      {
        "R",
        mode = { "o", "x" },
        function() require("flash").treesitter_search() end,
        desc = "Treesitter Search",
      },
      {
        "<c-s>",
        mode = { "c" },
        function() require("flash").toggle() end,
        desc = "Toggle Flash Search",
      },
    },
  },
  {
    "folke/trouble.nvim",
    opts = {},
    cmd = "Trouble",
    config = function()
      require("trouble").setup({})
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
}
