return {
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
