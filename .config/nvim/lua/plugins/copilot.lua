return {
  {
    'github/copilot.vim',
    version = 'v1.45.0',
    init = function()
      vim.g.copilot_no_tab_map = true
    end,
  },
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    version = 'v3.11.0',
    -- version = 'v3.4.0',  -- for neovim v0.9.5
    dependencies = {
      { "github/copilot.vim" },
      { "nvim-lua/plenary.nvim" },
    },
    build = "make tiktoken",
    opts = {},
  },
}
