set number
set wildignorecase
set tabstop=2
set shiftwidth=2
set softtabstop=2

set copyindent
set autoindent
set smartindent

set termguicolors

set linebreak
set wrap

set updatetime=500

set clipboard=unnamedplus

let g:lsp_semantic_enabled = 1
let g:lsp_diagnostics_virtual_text_enabled = 0
let g:lsp_diagnostics_echo_cursor = 1
let g:lsp_work_done_progress_enabled=0
let g:lsp_fold_enabled = 0

let mapleader = " "
nnoremap <Space> <Nop>

syntax enable

call plug#begin()

Plug 'sainnhe/everforest'
Plug 'morhetz/gruvbox'

Plug 'prabirshrestha/vim-lsp'
Plug 'tpope/vim-commentary'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'preservim/vim-pencil'
Plug 'junegunn/goyo.vim'

Plug 'kaarmu/typst.vim'
Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'npm ci'}

Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}

call plug#end()

source ~/lsp.vim

nnoremap y "+y
vnoremap y "+y
nnoremap Y "+Y
nnoremap yy "+yy
nnoremap <leader>f :Files!<CR>
nnoremap <leader>g :Rg<CR>

colorscheme everforest
let g:everforest_background="hard"

" colorscheme gruvbox
" let g:gruvbox_contrast_dark = "soft"
set background=dark

let $FZF_DEFAULT_COMMAND = 'fd --type f --hidden --follow --exclude .git'
" autocmd VimEnter * if argc() == 0 | call execute('Files') | endif

set nocompatible
filetype plugin on

" WRITING
function WriteMode()
	execute 'Goyo'
	call pencil#init()
	set spell
endfunction

augroup pencil
  autocmd!
  autocmd FileType markdown,mkd call WriteMode()
  autocmd FileType text         call WriteMode()
  autocmd FileType typst        call WriteMode()
augroup END
