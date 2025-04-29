return {

  -- {
  --   'sphamba/smear-cursor.nvim',
  --   opts = {
  --     smear_between_buffers = true,
  --     smear_between_neighbor_lines = true,
  --     scroll_buffer_space = true,
  --     legacy_computing_symbols_support = false,
  --     smear_insert_mode = true,
  --   },
  -- },

  { 'norcalli/nvim-colorizer.lua' },
  { 'preservim/vim-pencil' },
  { 'folke/zen-mode.nvim' },
  {
    'stevearc/dressing.nvim',
    opts = {},
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
    'fasterius/simple-zoom.nvim',
    config = true,
  },
  {
    "neanias/everforest-nvim",
    version = false,
    lazy = false,
    priority = 1000,
    config = function()
      require("everforest").setup({
        background = "soft",
      })
    end,

  },

  -- {
  --   'everviolet/nvim',
  --   name = 'evergarden',
  --   priority = 1000, -- Colorscheme plugin is loaded first before any other plugins
  --   opts = {
  --     theme = {
  --       variant = 'fall', -- 'winter'|'fall'|'spring'|'summer'
  --       accent = 'green',
  --     },
  --     editor = {
  --       transparent_background = false,
  --       sign = { color = 'none' },
  --       float = {
  --         color = 'mantle',
  --         invert_border = false,
  --       },
  --       completion = {
  --         color = 'surface0',
  --       },
  --     },
  --   }
  -- },

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
    config = true,
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
    -- cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    -- ft = { "markdown" },
    -- lazy = true,
    config = function()
      local cmd
      -- check if linux
      if vim.fn.executable("firefox") == 1 then
        cmd = "firefox --new-tab"
      else
        -- check if MacOS
        if vim.fn.executable("open") == 1 then
          cmd = "open -a Zen -n --args --new-tab"
        else
          vim.notify("firefox not found", vim.log.levels.WARN)
        end
      end
      vim.api.nvim_exec2(
        string.gsub(
          [[
			function MkdpBrowserFn(url)
			  execute '!#' a:url
			endfunction
			]],
          "#",
          cmd
        ),
        {}
      )
      vim.g.mkdp_browserfunc = "MkdpBrowserFn"
      vim.g.mkdp_preview_options = {
        disable_sync_scroll = 1,
        sync_scroll_type = 'bottom'
      }
    end,
    build = function() vim.fn["mkdp#util#install"]() end,

  },


}
