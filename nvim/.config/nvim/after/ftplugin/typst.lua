vim.cmd "Pencil"

vim.opt.spelllang = 'en_us'
vim.opt.spell = true
vim.opt.number = false
vim.opt.rnu = false

require("zen-mode").toggle({
	window = {
		width = .85,
		backdrop = 1,
	}
})

-- Function to watch Typst file
local function typst_watch()
	vim.cmd('vsp')
	vim.cmd('vertical resize 20')
	vim.cmd('terminal typst watch ' .. vim.fn.expand('%:'))
	vim.cmd('norm <c-w>h')
end

-- Key mapping
vim.keymap.set('n', '<leader>fc', typst_watch, { noremap = true, silent = true })

-- The other mappings remain the same
vim.keymap.set('n', '<leader>fr', function()
	vim.cmd('silent !zathura --fork ' .. vim.fn.expand('%:p:r') .. '.pdf &')
end, { noremap = true, silent = true })

-- Zen mode toggle (assuming you're using the zen-mode.nvim plugin)
require("zen-mode").toggle({
	window = {
		width = 0.85,
		backdrop = 1,
	}
})

require("cmp").setup({
	sources = {
		{
			name = "spell",
			option = {
				keep_all_entries = false,
				enable_in_context = function()
					return true
				end,
				preselect_correct_word = true,
			},
		},
	},
})
