set nocompatible
filetype off

" Hostname for host specific configuration
let s:hostname = substitute(system('hostname'), '\n', '', '')

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'tpope/vim-dispatch'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'tomtom/tcomment_vim'
Plugin 'gregsexton/gitv'
Plugin 'Shougo/vimproc.vim'
Plugin 'Shougo/neomru.vim'
Plugin 'dkprice/vim-easygrep'
Plugin 'altercation/vim-colors-solarized'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'mbbill/undotree'
Plugin 'Kris2k/A.vim'
Plugin 'kris89/vim-multiple-cursors'
Plugin 'SirVer/ultisnips'
Plugin 'wikitopian/hardmode'
"Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'Chiel92/vim-autoformat'
Plugin 'Valloric/ListToggle'
Plugin 'ngg/vim-protobuf'
Plugin 'rust-lang/rust.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'qwertologe/nextval.vim'
Plugin 'elzr/vim-json'
Plugin 'peterhoeg/vim-qml'
" Plugin 'git@bitbucket.org:tresorit/vim-lldb.git'
" Plugin 'gilligan/vim-lldb'
Plugin 'ctrlpvim/ctrlp.vim'
call vundle#end()
filetype plugin indent on

set history=1000
set undolevels=1000
set so=7
set hid
set ignorecase
set smartcase
set hlsearch
set incsearch
set lazyredraw
set ttyfast
set magic
set showmatch
set mat=2
set noerrorbells
set novisualbell
set t_vb=
set tm=500
set relativenumber
set number

set t_Co=256
set mouse=a

set tabstop=4
set softtabstop=0
set noexpandtab
set shiftwidth=4

set smarttab
set autoindent
set smartindent
set pastetoggle=<F3>

set cursorline
set wildmenu
set title

set diffopt+=vertical
set exrc
set secure

set nobackup
set writebackup
set noswapfile
set tw=120

" Refresh modified files
set autoread
set updatetime=1000
" autocmd CursorHold,CursorHoldI,WinEnter,BufWinEnter * silent! checktime

" Share X windows clipboard
if has('unnamedplus')
	set clipboard=unnamedplus
endif

" Override gentoo vimrc
let g:leave_my_textwidth_alone = 1

" Save as root
cmap w!! w !sudo tee % >/dev/null

" gitgutter
let g:gitgutter_map_keys = 0
let g:gitgutter_max_signs = 5000
nmap ]h <Plug>GitGutterNextHunk
nmap [h <Plug>GitGutterPrevHunk
nmap <leader>hs <Plug>GitGutterStageHunk
nmap <leader>hr <Plug>GitGutterRevertHunk
nmap <leader>hp <Plug>GitGutterPreviewHunk

" nextval
nmap <silent> + <Plug>nextvalInc
nmap <silent> - <Plug>nextvalDec

" EasyGrep
let g:EasyGrepCommand=1
nnoremap <leader>/ :Grep<space>

" UltiSnip
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<c-y>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" good for airline
set laststatus=2
set noshowmode
set background=light
let g:airline_theme='solarized'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#tabline#show_tabs = 1
" let g:airline_powerline_fonts=1
silent! call airline#extensions#whitespace#disable()

"let g:solarized_termcolors = 16
"let g:solarized_termtrans = 1
colorscheme solarized

" EasyMotion
let g:EasyMotion_smartcase = 1
let g:EasyMotion_do_mapping = 0
nmap s <Plug>(easymotion-s2)
omap t <Plug>(easymotion-t)
omap / <Plug>(easymotion-tn)
map <leader>j <Plug>(easymotion-j)
map <leader>k <Plug>(easymotion-k)
"map / <Plug>(easymotion-sn)
"map n <Plug>(easymotion-next)
"map N <Plug>(easymotion-prev)

" YCM
let g:ycm_extra_conf_globlist = ['~/git/*', '!~/*']
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_always_populate_location_list = 1
let g:ycm_error_symbol = 'E>'
let g:ycm_warning_symbol = 'W>'
let g:ycm_complete_in_comments = 1
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_key_invoke_completion = '<C-Space>'
nnoremap <silent> <leader>g :YcmCompleter GoTo<CR>

" ListToggle
let g:lt_location_list_toggle_map = '<leader>l'
let g:lt_quickfix_list_toggle_map = '<leader>q'
let g:lt_height = 15

function! GetTresoritLinuxPath()
	return getcwd() . "../Build/debug/tresorit"
endfunc

" LLDB
nnoremap <silent> <F8> :Lcontinue<CR>
nnoremap <silent> <F9> :Lbreakpoint<CR>
nnoremap <silent> <F10> :Lnext<CR>
nnoremap <silent> <F11> :Lstep<CR>
nnoremap <silent> <leader><F11> :Lfinish<CR>
function! g:StartDebug(program)
	exec "Ltarget " . a:program
	exec "Lbreakpoint set --name main"
	exec "Lhide disassembly"
	exec "Lhide registers"
	exec "Lstart "
endfunction
nnoremap <F6> :call StartDebug(GetTresoritLinuxPath())<Left><Left>
" nnoremap <leader><F5> :call StartDebug(g:GetTresoritPath(), "-t " . expand("<cword>" . ""))<Left><Left><Left>

" Better regex syntax
nnoremap / /\v
vnoremap / /\v
cnoremap s/ s/\v

" Faster Escape
inoremap jj <ESC>

" In normal mode, we use : much more often than ; so lets swap them.
" WARNING: this will cause any "ordinary" map command without the "nore" prefix
" that uses ":" to fail. For instance, "map <f2> :w" would fail, since vim will
" read ":w" as ";w" because of the below remappings. Use "noremap"s in such
" situations and you'll be fine.
nnoremap ; :
nnoremap : ;
vnoremap ; :
vnoremap : ;

" Re-adjust windows on window resize
autocmd VimResized * wincmd =

" C++ shortcuts
nmap <silent> <leader>sm ysiw)istd::move<Esc>

syntax enable
let g:load_doxygen_syntax = 1

noremap <silent> <F1> :bp<CR>
inoremap <silent> <F1> <Esc>:bp<CR>
noremap <silent> <F2> :bn<CR>
inoremap <silent> <F2> <Esc>:bn<CR>
noremap <silent> <F4> :A<CR>
inoremap <silent> <F4> <Esc>:A<CR>
noremap <silent> <leader>u :UndotreeToggle<CR>
nnoremap <silent> <space> :noh<CR><space>
nnoremap <silent> <leader>gv :Gitv --date-order<CR>
nnoremap <silent> <leader>gV :Gitv! --date-order<CR>

" autocmd VimEnter,BufNewFile,BufReadPost * silent! call HardMode()

set undodir=~/.vim/undohistory
set undofile

set backspace=2

" trim whitespaces
autocmd BufWritePre * :%s/\s\+$//e
autocmd BufWrite * :Autoformat
autocmd FileType qml let b:autoformat_autoindent=0

" gui settings
" set go=acgt
set go=acgtm " (m is for menubar in gui)
set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 10

" bufferdelete on F3
noremap <silent> <F3> :bd<CR><CR>

" disable updating the default register on pasting and single character
" deletion using the black hole register (/dev/null)
vnoremap p "_dP
noremap x "_x

" devel mappings
" :!../Scripts/build.sh Run
" :!../Scripts/lrelease.sh LRelease
" :!../Scripts/lupdate.sh LUpdate

" CtlrP
let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
if executable('ag')
	" Use Ag over Grep
	set grepprg=ag\ --nogroup\ --nocolor

	" Use ag in CtrlP for listing files; respects .gitignore
	let g:ctrlp_user_command = 'ag %s -i -l --nocolor -g ""'

	" ag is fast enough that CtrlP doesn't need to cache
	" let g:ctrlp_use_caching = 0
endif
" let g:ctrlp_custom_ignore = '\v[\/]TresoritCore$'
