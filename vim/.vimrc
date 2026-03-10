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

set updatetime=100
set cmdheight=2

set clipboard=unnamedplus

set noswapfile
set incsearch

let g:lsp_semantic_enabled = 1
let g:lsp_diagnostics_virtual_text_enabled = 0
let g:lsp_diagnostics_echo_cursor = 1
let g:lsp_work_done_progress_enabled=0
let g:lsp_fold_enabled = 0
let g:lsp_fold_enabled = 0

let mapleader = " "
nnoremap <Space> <Nop>

" read option as Alt to avoid Mac horseshit
if has('mac') || has('macunix')
	nnoremap ∆ <C-w>+  
	nnoremap ˚ <C-w>-
	nnoremap ˙ <C-w><
	nnoremap ¬ <C-w>>
endif


syntax enable

call plug#begin()

Plug 'sainnhe/everforest'
Plug 'sainnhe/gruvbox-material'
Plug 'morhetz/gruvbox'

Plug 'tpope/vim-commentary'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'srstevenson/vim-picker'

Plug 'preservim/vim-pencil'
Plug 'junegunn/goyo.vim'

Plug 'kaarmu/typst.vim'
Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'npm ci'}

Plug 'nextflow-io/vim-language-nextflow', { 'commit': 'd01f1ccaf8db1d9ed5fbacceddbb7735429e6062' }

Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}

Plug 'christoomey/vim-tmux-navigator'
Plug 'tmsvg/pear-tree'

call plug#end()

source ~/lsp.vim

nnoremap y "+y
vnoremap y "+y
nnoremap Y "+Y
nnoremap yy "+yy
" nnoremap <leader>f :Files!<CR>
nnoremap <leader>g :Rg<CR>
nnoremap <leader>f :PickerEdit<CR>


nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l


let g:everforest_background="hard"
colorscheme everforest

set background=dark

autocmd VimEnter * if argc() == 0 | call timer_start(1, { -> execute('PickerEdit') }) | endif

let g:picker_custom_find_executable = 'rg'
let g:picker_custom_find_flags = '--color never --files --max-depth 5 --hidden -L'

" only use enter to confirm suggestsions if suggestions are actually showing!
inoremap <silent><expr> <CR> pumvisible() ? coc#_select_confirm() : "\<CR>"

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

" restore cursor position on file open
augroup RestoreCursor
	autocmd!
	autocmd BufReadPost *
				\ let line = line("'\"")
				\ | if line >= 1 && line <= line("$") && &filetype !~# 'commit'
				\      && index(['xxd', 'gitrebase'], &filetype) == -1
				\      && !&diff
				\ |   execute "normal! g`\""
				\ | endif
augroup END

let g:pear_tree_repeatable_expand = 0
