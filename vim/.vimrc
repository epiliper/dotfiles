set number
set wildignorecase
set tabstop=2
set shiftwidth=2
set softtabstop=2

set scrolloff=3

set copyindent
set autoindent
set smartindent

set hidden

set formatoptions-=t

set termguicolors

set linebreak
" set wrap

set hidden

set updatetime=100
set cmdheight=2

set clipboard=unnamedplus

set noswapfile
set hidden
set incsearch

let g:Hexokinase_highlighters = ['backgroundfull']
let g:coc_start_at_startup = 1

let mapleader = " "
nnoremap <Space> <Nop>

syntax enable
let mapleader = " "
nnoremap <Space> <Nop>

call plug#begin()

Plug 'sainnhe/everforest'
Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }
Plug 'chriskempson/base16-vim'
Plug 'chasinglogic/modus-themes-vim'
Plug 'bluz71/vim-moonfly-colors', { 'as': 'moonfly' }
Plug 'davidosomething/vim-colors-meh'
Plug 'nordtheme/vim'
Plug 'chriskempson/base16-vim'

Plug 'kaarmu/typst.vim'

Plug 'tpope/vim-commentary'
Plug 'markonm/traces.vim'

Plug 'preservim/nerdtree'

Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'srstevenson/vim-picker'

" Plug 'prabirshrestha/vim-lsp'
" Plug 'mattn/vim-lsp-settings'

Plug 'preservim/vim-pencil'
Plug 'junegunn/goyo.vim'

Plug 'neoclide/coc.nvim', {'do': 'npm ci', 'commit': 'd6db809b14f32f6db423d47fae1d61b6f023934c'}

Plug 'nextflow-io/vim-language-nextflow', { 'commit': 'd01f1ccaf8db1d9ed5fbacceddbb7735429e6062' }

Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}

Plug 'drmikehenry/vim-fixkey'
Plug 'christoomey/vim-tmux-navigator'
Plug 'mechatroner/rainbow_csv'
Plug 'RyanMillerC/better-vim-tmux-resizer'

Plug 'tmsvg/pear-tree'
Plug 'romainl/Apprentice'

call plug#end()

source ~/lsp.vim
" source ~/typst.vim

nnoremap y "+y
vnoremap y "+y
nnoremap Y "+Y
nnoremap yy "+yy

nnoremap <leader>g :Rg<CR>
nnoremap <leader>f :PickerEdit<CR>
nnoremap <leader>ee :NERDTreeToggle<CR>

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l


" tmux resize
let g:tmux_resizer_no_mappings = 1

nnoremap <silent> <A-h> :TmuxResizeLeft<CR>
nnoremap <silent> <A-j> :TmuxResizeDown<CR>
nnoremap <silent> <A-k> :TmuxResizeUp<CR>
nnoremap <silent> <A-l> :TmuxResizeRight<CR>

nnoremap <leader>bb :Buffers<CR>
nnoremap <leader>t :GitGutterDiffOrig<CR>

" let g:everforest_transparent_background=1
" colorscheme everforest
" colorscheme nord
colorscheme habamax

set background=dark

" BEGIN: transparent background
highlight Normal guibg=NONE ctermbg=NONE
highlight NonText guibg=NONE ctermbg=NONE
highlight SignColumn guibg=NONE ctermbg=NONE
" END: transparent background

autocmd VimEnter * if argc() == 0 | call timer_start(1, { -> execute('PickerEdit') }) | endif

let g:picker_custom_find_executable = 'rg'
let g:picker_custom_find_flags = '--color never --files --max-depth 5 --hidden -L'


set nocompatible
filetype plugin on

" WRITING
:hi SpellBad cterm=underline
let g:typst_pdf_viewer = "zathura"

function WriteMode()
	execute 'PencilSoft'
	set spell
endfunction

function WriteModeTypst()
	autocmd TextChanged,TextChangedI *.typ silent! execute 'write! ' . expand('%:r') . '.watch.' . expand('%:e')
endfunction


function WriteModeMarkdown()
	execute 'MarkdownPreview'
	call WriteMode()
endfunction

augroup pencil
  autocmd!
  autocmd FileType markdown,mkd call WriteModeMarkdown()
  autocmd FileType text         call WriteMode()
  autocmd FileType typst        call WriteModeTypst()
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

" PEARTREE
let g:pear_tree_repeatable_expand = 0

" Disable automapping so we can fix Coc mapping.
let g:pear_tree_map_special_keys = 0

" Default mappings:
imap <BS> <Plug>(PearTreeBackspace)
imap <Esc> <Plug>(PearTreeFinishExpansion)

" Get PearTreeExpand working with coc.nvim
imap <expr> <CR> pumvisible() ? coc#_select_confirm() : "\<Plug>(PearTreeExpand)"


set statusline=%f\ -\ FileType:\ %y
set laststatus=2

" ALWAYS KEEP THIS AT THE BOTTOM
" don't want vim randomly parse commands from files
set nomodeline
