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

let mapleader = " "
nnoremap <Space> <Nop>

syntax enable

call plug#begin()

Plug 'sainnhe/everforest'
Plug 'prabirshrestha/vim-lsp'
Plug 'tpope/vim-commentary'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}

call plug#end()


nnoremap y "+y
vnoremap y "+y
nnoremap Y "+Y
nnoremap yy "+yy
nnoremap <leader>f :Files!<CR>
nnoremap <leader>g :Rg<CR>

colorscheme everforest
let g:everforest_background="hard"
set background=dark

" LSP SETUP STUFF
if executable('basedpyright')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'basedpyright',
        \ 'cmd': {server_info->['basedpyright']},
        \ 'allowlist': ['python'],
        \ })
endif

if executable('clangd')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'clangd',
        \ 'cmd': {server_info->['clangd']},
        \ 'allowlist': ['c'],
        \ })
endif

if executable('rust-analyzer')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'rust-analyzer',
        \ 'cmd': {server_info->['rust-analyzer']},
        \ 'allowlist': ['rust'],
        \ })
endif

function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=yes
    if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
    nmap <buffer> gd <plug>(lsp-definition)
    nmap <buffer> gs <plug>(lsp-document-symbol-search)
    nmap <buffer> gS <plug>(lsp-workspace-symbol-search)
    nmap <buffer> gr <plug>(lsp-references)
    nmap <buffer> gi <plug>(lsp-implementation)
    nmap <buffer> gt <plug>(lsp-type-definition)
    nmap <buffer> <leader>rn <plug>(lsp-rename)
    nmap <buffer> [g <plug>(lsp-previous-diagnostic)
    nmap <buffer> ]g <plug>(lsp-next-diagnostic)
    nmap <buffer> K <plug>(lsp-hover)
    nnoremap <buffer> <expr><c-f> lsp#scroll(+4)
    nnoremap <buffer> <expr><c-d> lsp#scroll(-4)

    let g:lsp_format_sync_timeout = 1000
    autocmd! BufWritePre *.rs,*.go call execute('LspDocumentFormatSync')
    
    " refer to doc to add more commands
endfunction

augroup lsp_install
    au!
    " call s:on_lsp_buffer_enabled only for languages that has the server registered.
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

let $FZF_DEFAULT_COMMAND = 'fd --type f --hidden --follow --exclude .git'
autocmd VimEnter * if argc() == 0 | call execute('Files!') | endif
