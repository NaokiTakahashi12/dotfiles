return {
  {
    'romgrk/barbar.nvim',
    version = '^1.0.0', -- optional: only update when a new 1.x version is released
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
    config = function()
      require("barbar").setup {
        clickable = false,
        icons = {
          filetype = {
            enabled = false,
          },
          button = "o",
        }
      }
    end,
  },
  {
    "folke/persistence.nvim",
    version = "v3.1.0",
    event = "BufReadPre",
    opts = {},
    config = function()
      require("persistence").setup {
        options = { 'globals' },
        pre_save = function()
          vim.api.nvim_exec_autocmds('User', { pattern = 'SessionSavePre' })
        end,
      }
    end,
  },
}
