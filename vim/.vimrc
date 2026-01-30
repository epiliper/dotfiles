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

Plug 'christoomey/vim-tmux-navigator'

call plug#end()

source ~/lsp.vim

noremap :W :w

nnoremap y "+y
vnoremap y "+y
nnoremap Y "+Y
nnoremap yy "+yy
nnoremap <leader>f :Files!<CR>
nnoremap <leader>g :Rg<CR>

" buffer navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-j>h
nnoremap <C-k> <C-k>h
nnoremap <C-l> <C-l>h

let g:everforest_background="hard"
colorscheme everforest

set background=dark

autocmd VimEnter * let $FZF_DEFAULT_COMMAND = 'fd --type f --hidden --follow --exclude .git'
autocmd VimEnter * if argc() == 0 | call timer_start(10, { -> execute('Files!') }) | endif
"
set nocompatible
filetype plugin on

" WRITING
:hi SpellBad cterm=underline
let g:typst_pdf_viewer = "LivePDFviewer"

function WriteMode()
	" execute 'Goyo'
	call pencil#init()
	set spell
endfunction

augroup pencil
  autocmd!
  autocmd FileType markdown,mkd call WriteMode()
  autocmd FileType text         call WriteMode()
  autocmd FileType typst        call WriteMode()
augroup END
