return {

	{
		'nvim-telescope/telescope-fzf-native.nvim',
		build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release'
	},
	{
		"nvim-telescope/telescope.nvim",
		config = function()
			local builtin = require('telescope.builtin')

			vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
			vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
			vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
			vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
			vim.keymap.set('n', '<leader>fd', builtin.diagnostics, {})

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
