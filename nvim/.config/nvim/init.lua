require("eli.remap")
vim.loader.enable()

-- LAZY CONFIG
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)


require("lazy").setup("plugins")

-- keymaps and misc changes
vim.keymap.set("n", "<leader>y", "'+y")
vim.keymap.set("v", "<leader>y", "'+y")
vim.keymap.set("n", "<leader>Y", "'+Y")
vim.keymap.set("n", "<leader>m", '<Cmd>!make<CR>')

vim.opt.number = true
vim.o.termguicolors = true

-- vim.opt.cursorline = true
vim.opt.cursorlineopt = "number"
vim.opt.numberwidth = 4
vim.opt.fillchars:append { eob = " " }
vim.opt.scrolloff = 10

vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true

vim.cmd("hi! Normal guibg=NONE ctermbg=NONE")
vim.cmd("hi! NonText guibg=NONE ctermbg=NONE")
vim.cmd("hi! NormalNC ctermbg=NONE guibg=NONE")
vim.cmd("hi! NvimTreeEndOfBuffer ctermbg=NONE guibg=NONE guifg=NONE ctermbg=NONE")
vim.cmd("hi! NormalFloat ctermbg=NONE guibg=NONE")
vim.cmd("hi! LineNr guibg=NONE ctermbg=NONE")
vim.cmd("hi! SignColumn guibg=NONE ctermbg=NONE")
vim.cmd("colorscheme everforest")
-- vim.cmd("colorscheme onedark")
--
-- colorscheme
vim.api.nvim_set_option("synmaxcol", 200)

vim.opt.wrap = true
vim.opt.linebreak = true

cmdheight = 0

-- make splits auto-resize
vim.api.nvim_command('autocmd VimResized * wincmd =')

-- telescope configuration
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>f', builtin.find_files, {})
vim.keymap.set('n', '<leader>g', builtin.live_grep, {})
vim.keymap.set('n', '<leader>b', builtin.buffers, {})
vim.keymap.set('n', '<leader>h', builtin.help_tags, {})
vim.keymap.set('n', '<leader>d', builtin.diagnostics, {})
vim.keymap.set('n', '<leader>s', builtin.lsp_document_symbols, {})
