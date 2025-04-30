return {
  {
    "nvim-neotest/neotest",
    version = 'v5.8.0',
    enabled = true,
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-treesitter/nvim-treesitter",
      "nvim-neotest/neotest-plenary",
      "nvim-neotest/neotest-python",
      "alfaix/neotest-gtest",
    },
    config = function()
      require('neotest').setup {
        adapters = {
          require('neotest-python') {
            dap = {
              justMyCode = false,
            },
          },
          require('neotest-plenary'),
          require('neotest-gtest'),
        },
      }
    end,
  },
}
