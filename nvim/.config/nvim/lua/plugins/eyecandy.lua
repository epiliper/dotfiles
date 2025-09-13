return {

  { 'norcalli/nvim-colorizer.lua' },

  {
    'chomosuke/typst-preview.nvim',
    lazy = false, -- or ft = 'typst'
    version = '1.*',
    opts = {},    -- lazy.nvim will implicitly calls `setup {}`
  },

  {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup({
        sign_priority = 100,
      })
    end
  },
  {
    "neanias/everforest-nvim",
    version = false,
    lazy = false,
    priority = 1000,
    config = function()
      require("everforest").setup({
        background = "hard",
        transparent_background_level = 2,
      })
    end,

  },

  { "nvim-lua/plenary.nvim" },

  {
    "nvim-tree/nvim-web-devicons",
    config = function()
      require('nvim-web-devicons').setup()
    end,
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    ops = {},
    config = function()
      require("ibl").setup({
        exclude = {
          filetypes = {
            "dashboard"
          }
        }
      })
    end,
  },
  {
    "lukas-reineke/headlines.nvim",
    dependencies = "nvim-treesitter/nvim-treesitter",
    config = true, -- or `opts = {}`
  },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('lualine').setup({
      })
    end,
  },
  {
    "iamcco/markdown-preview.nvim",
  }


}
