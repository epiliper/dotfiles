return {

  {
    'nvim-telescope/telescope-fzf-native.nvim',
    build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release'
  },
  {
    "nvim-telescope/telescope.nvim",
    config = function()
      local builtin = require('telescope.builtin')

      vim.keymap.set('n', '<leader>f', builtin.find_files, {})
      vim.keymap.set('n', '<leader>g', builtin.live_grep, {})
      vim.keymap.set('n', '<leader>b', builtin.buffers, {})
      vim.keymap.set('n', '<leader>r', "<cmd>Telescope aerial<CR>")
      vim.keymap.set('n', '<leader>d', builtin.diagnostics, {})

      require("telescope").setup {
        pickers = {
          find_files = {
            theme = "dropdown",
            hidden = true
          }
        }
      }
      require("telescope").load_extension("fzf")
    end
  }
}
