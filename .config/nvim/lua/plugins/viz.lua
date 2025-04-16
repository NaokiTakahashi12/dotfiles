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
    end
  },
  {
    'j-hui/fidget.nvim',
    version = 'v1.6.1',
    config = function()
      require('fidget').setup({})
    end
  },
}
