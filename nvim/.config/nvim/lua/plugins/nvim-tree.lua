return {
  'nvim-tree/nvim-tree.lua',

  config = function()
    require("nvim-tree").setup({
      sort = {
        sorter = "case_sensitive",
      },
      view = {
        width = 30,
        signcolumn = "yes",
      },
      renderer = {
        group_empty = true,
        icons = {
          webdev_colors = true,
          show = {
            file = true,
            folder = true,
            folder_arrow = false,
            git = false,
          }
        }
      },
      filters = {
        dotfiles = true,
      },

      git = {
        enable = false,
      },
    })

    local keymap = vim.keymap

    keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" })

    vim.api.nvim_set_hl(0, "NvimTreeNormal", {
      fg = "none",
      bg = "none",
      ctermbg = "none"
    })
  end,

}
