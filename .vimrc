set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'tpope/vim-dispatch'
Plugin 'tpope/vim-fugitive'
Plugin 'tomtom/tcomment_vim'
Plugin 'gregsexton/gitv'
Plugin 'Shougo/vimproc.vim'
Plugin 'Shougo/unite.vim'
Plugin 'Shougo/neomru.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'bling/vim-airline'
Plugin 'Valloric/YouCompleteMe'
Plugin 'mbbill/undotree'
Plugin 'Kris2k/A.vim'
Plugin 'kris89/vim-multiple-cursors'
Plugin 'SirVer/ultisnips'
Plugin 'wikitopian/hardmode'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'Chiel92/vim-autoformat'
Plugin 'mhinz/vim-startify'
Plugin 'https://bitbucket.org/tresorit/vim-lldb.git'
Plugin 'https://bitbucket.org/tresorit/vimtresorit.git'
call vundle#end()
filetype plugin indent on

set history=1000
set undolevels=1000
set autoread
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

" Override gentoo vimrc
let g:leave_my_textwidth_alone = 1

" Save as root
cmap w!! w !sudo tee % >/dev/null

"let g:unite_prompt='» '
call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_rank'])
nnoremap <silent> <C-p> :Unite file_rec/async -start-insert<cr>
nnoremap <silent> <C-i> :Unite file_mru -start-insert<cr>
if executable('ag')
	let g:unite_source_grep_command = 'ag'
	let g:unite_source_grep_default_opts = '--line-numbers --nocolor --nogroup --hidden --ignore ''.hg'' --ignore ''.svn'' --ignore ''.git'' --ignore ''.bzr'''
	let g:unite_source_grep_recursive_opt = ''
	
	function! s:ReplaceInFiles(search, replace)
		exec "!ag -l " . a:search . " | xargs sed -i 's@" . a:search . "@" . a:replace . "@g'"
	endfunction
	command! -nargs=+ ReplaceInFiles call s:ReplaceInFiles(<f-args>)
endif
nnoremap <silent> <leader>/ :Unite grep:.<cr>
let g:unite_source_history_yank_enable = 1
nnoremap <silent> <leader>y :Unite history/yank<cr>
nnoremap <silent> <leader>b :Unite -quick-match buffer<cr>

" UltiSnip
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<c-y>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" For Tresorit
noremap <silent> <F3> :Autoformat<CR><CR>
nnoremap <silent> <leader>mh :ToggleMakeHost<CR>
nnoremap <silent> <leader>mc :ToggleMakeCompiler<CR>
nnoremap <silent> <leader>md :ToggleMakeDebug<CR>
nnoremap <silent> <leader>mt :ToggleMakeTests<CR>
nnoremap <silent> <leader>mi :PrintMakeInformation<CR>
nnoremap <silent> <leader>bf :exec ":Make -j5 " . g:GetBuildFileParams(@%)<CR>
nnoremap <silent> <leader>bp :exec ":Make! -j5 " . g:GetBuildProjectParams(@%)<CR>
nnoremap <silent> <leader>ba :exec ":Make! -j5 " . g:GetBuildAllParams(@%)<CR>
nnoremap <silent> <leader>bak :exec ":Make! -j5 -k " . g:GetBuildAllParams(@%)<CR>
nnoremap <silent> <leader>bp :exec ":Make! -j5 " . g:GetBuildProjectParams(@%)<CR>

" good for airline
set laststatus=2
set noshowmode
let g:airline_theme='solarized'
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts=1

" EasyMotion
let g:EasyMotion_smartcase = 1
let g:EasyMotion_do_mapping = 0
nmap s <Plug>(easymotion-s2)
omap t <Plug>(easymotion-t)
map <leader>j <Plug>(easymotion-j)
map <leader>k <Plug>(easymotion-k)
map / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
map n <Plug>(easymotion-next)
map N <Plug>(easymotion-prev)

" YCM
let g:ycm_extra_conf_globlist = ['~/git/*', '!~/*']
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_error_symbol = 'E>'
let g:ycm_warning_symbol = 'W>'
let g:ycm_complete_in_comments = 1
let g:ycm_seed_identifiers_with_syntax = 1

syntax enable
let g:load_doxygen_syntax = 1

set background=dark
let g:solarized_termcolors = 16
let g:solarized_termtrans = 1
colorscheme solarized

noremap <silent> <F1> :bp<CR>
noremap <silent> <F2> :bn<CR>
noremap <silent> <F4> :A<CR>
noremap <silent> <leader>u :UndotreeToggle<CR>
nnoremap <silent> <space> :noh<CR><space>
nnoremap <silent> <leader>gv :Gitv --date-order<CR>
nnoremap <silent> <leader>gV :Gitv! --date-order<CR>

autocmd VimEnter,BufNewFile,BufReadPost * silent! call HardMode()

set undodir=~/.vim/undohistory
set undofile

set backspace=2
