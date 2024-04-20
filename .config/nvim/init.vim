call plug#begin()
    " Repeat last action with dot
    Plug 'tpope/vim-repeat'

    " Git changes in editor
    Plug 'airblade/vim-gitgutter'

    " Syntax highlighting
	Plug 'sheerun/vim-polyglot'

    " Tab completion
    Plug 'neoclide/coc.nvim', {'branch': 'release'}

	" Fuzzy finder
    Plug 'ctrlpvim/ctrlp.vim'

    " Comment with gc
    Plug 'tpope/vim-commentary'

    " NORDTree
    Plug 'preservim/nerdtree'
    Plug 'Xuyuanp/nerdtree-git-plugin'
    Plug 'ryanoasis/vim-devicons'

    " Color schemes
    Plug 'navarasu/onedark.nvim'

    " CtrlSF
    Plug 'dyng/ctrlsf.vim'

    " Copilot
    Plug 'github/copilot.vim'
call plug#end()

filetype plugin indent on
set encoding=UTF-8

" set history=1000
" set undolevels=1000
" set so=7
" set hid
set ignorecase
set smartcase
" set hlsearch
" set incsearch
" set lazyredraw
" set ttyfast
" set magic
" set showmatch
" set mat=2
" set noerrorbells
" set novisualbell
" set t_vb=
" set tm=500
set number

set tabstop=4
set softtabstop=0
set expandtab
set shiftwidth=4

set smarttab
set autoindent
set smartindent

set cursorline
set wildmenu
set title

set diffopt+=vertical
" set exrc
" set secure

set nobackup
set nowritebackup
set noswapfile
set signcolumn=yes

" Refresh modified files
set autoread
set updatetime=300

" Save as root
cmap w!! w !sudo tee % >/dev/null

" gitgutter
" let g:gitgutter_map_keys = 0
" let g:gitgutter_max_signs = 5000
nmap ]h <Plug>(GitGutterNextHunk)
nmap [h <Plug>(GitGutterPrevHunk)
" nmap <leader>hs <Plug>GitGutterStageHunk
" nmap <leader>hr <Plug>GitGutterRevertHunk
" nmap <leader>hp <Plug>GitGutterPreviewHunk

" Commentary
autocmd FileType cs setlocal commentstring=//\ %s

" dart indent
autocmd FileType dart setlocal shiftwidth=2 softtabstop=2 expandtab

" Ctrlp
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|build'

" CtrlSF
let g:ctrlsf_default_view_mode = 'compact'

" NERDTree
" autocmd VimEnter * NERDTree | wincmd p

nnoremap <C-b> :NERDTreeToggle<CR>
nnoremap <F3> :NERDTreeFind<CR>
let g:NERDTreeMapActivateNode="<F3>"
let g:NERDTreeMapPreview="<F4>"

let NERDTreeShowHidden=1
let NERDTreeMouseMode=3
let NERDTreeSortHiddenFirst=0
let g:NERDTreeGitStatusIndicatorMapCustom = {
    \ "Modified"  : "•",
    \ "Staged"    : "◊",
    \ "Untracked" : "∆",
    \ "Renamed"   : "≈",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "x",
    \ "Dirty"     : "•",
    \ "Clean"     : "Ø",
    \ "Unknown"   : "?"
    \ }


" ALE: {{{
let g:ale_sign_error = '•'
let g:ale_sign_warning = '•'
let g:ale_sign_info = '·'
let g:ale_sign_style_error = '·'
let g:ale_sign_style_warning = '·'

let g:ale_linters = { 'cs': ['OmniSharp'] }
" }}}

" Coc: {{{
" https://github.com/razzmatazz/csharp-language-server

" Use tab for trigger completion with characters ahead and navigate
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)


" goto navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> gi <Plug>(coc-implementation)

" Symbol renaming
nmap <leader>rn <Plug>(coc-rename)

" Applying code actions to the selected code block
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying code actions at the cursor position
nmap <leader>ac  <Plug>(coc-codeaction-cursor)
" Remap keys for apply code actions affect whole buffer
nmap <leader>as  <Plug>(coc-codeaction-source)
" Apply the most preferred quickfix action to fix diagnostic on the current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Find symbol of current document
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" }}}

" In normal mode, we use : much more often than ; so lets swap them.
" WARNING: this will cause any "ordinary" map command without the "nore" prefix
" that uses ":" to fail. For instance, "map <f2> :w" would fail, since vim will
" read ":w" as ";w" because of the below remappings. Use "noremap"s in such
" situations and you'll be fine.
nnoremap ; :
nnoremap : ;
vnoremap ; :
vnoremap : ;

" Ctrl + up-down jumps 40 lines
silent! nnoremap <C-Down> 40j
silent! nnoremap <C-Up> 40k
silent! nnoremap <C-j> 40j
silent! nnoremap <C-k> 40k

syntax enable

" set background=dark
colorscheme onedark

noremap <silent> <F1> :bp<CR>
inoremap <silent> <F1> <Esc>:bp<CR>
noremap <silent> <F2> :bn<CR>
inoremap <silent> <F2> <Esc>:bn<CR>
nnoremap <silent> <space> :noh<CR><space>


