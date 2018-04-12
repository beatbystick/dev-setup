set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

Plugin 'Valloric/YouCompleteMe'
Plugin 'w0rp/ale'
Plugin 'haya14busa/incsearch.vim'
Plugin 'haya14busa/incsearch-fuzzy.vim'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'haya14busa/incsearch-easymotion.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'kien/ctrlp.vim'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'bling/vim-airline'
Plugin 'leafgarland/typescript-vim'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-fugitive'
Plugin 'mileszs/ack.vim'
Plugin 'fatih/vim-go'
Plugin 'scrooloose/nerdcommenter'
Plugin 'ternjs/tern_for_vim'
Plugin 'junegunn/gv.vim'
Plugin 'ap/vim-css-color'
Plugin 'ihacklog/HiCursorWords'
Plugin 'yssl/QFEnter'
Plugin 'tpope/vim-rhubarb'
Plugin 'suan/vim-instant-markdown'
Plugin 'prettier/vim-prettier'
Plugin 'python-mode/python-mode'
Plugin 'chriskempson/base16-vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

behave xterm

set laststatus=2
set encoding=utf-8
set ruler
set ignorecase
set smartcase
set hlsearch
set incsearch
set showmatch
set cindent

set guicursor+=n-c:blinkon1

syntax enable

set expandtab
set smarttab
set shiftwidth=4
set tabstop=4

set ai
set si
set wrap
set autoread

set backspace=2
set completeopt-=preview
set backupcopy=yes
set pastetoggle=<F3>

set diffopt+=vertical

let mapleader = "\<Space>"

autocmd BufWritePre *.go :GoBuild

autocmd FileType javascript set formatprg=prettier\ --stdin\ --trailing-comma\ es5\ --tab-width\ 4\ --single-quote
autocmd FileType typescript set formatprg=prettier\ --stdin\ --parser\ typescript\ --trailing-comma\ es5\ --tab-width\ 4\ --single-quote

autocmd FileType graphql setlocal shiftwidth=4 tabstop=4 noexpandtab
autocmd FileType typescript setlocal shiftwidth=4 tabstop=4 
autocmd FileType javascript setlocal shiftwidth=4 tabstop=4
autocmd FileType jax setlocal shiftwidth=4 tabstop=4
autocmd FileType sql setlocal shiftwidth=4 tabstop=4 noexpandtab
autocmd FileType html setlocal shiftwidth=2 tabstop=2
autocmd FileType jinja setlocal shiftwidth=2 tabstop=2
autocmd FileType scss setlocal shiftwidth=4 tabstop=4
autocmd FileType ruby setlocal shiftwidth=2 tabstop=2
autocmd FileType yaml setlocal shiftwidth=2 tabstop=2

au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
au FileType go nmap <Leader>dt <Plug>(go-def-tab)
au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)

" Config
let g:ale_sign_error = "✗"
let g:ale_sign_warning = "⚠"
let g:ale_linters = {'go': ['goimports', 'golint', 'staticcheck']}
let g:ale_lint_on_enter = 0
let g:ale_lint_on_save = 0
" let g:syntastic_python_pylint_args = '--rcfile=~/.pylintrc' 
" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_check_on_open = 0
" let g:syntastic_check_on_wq = 1
" let g:syntastic_error_symbol = "✗"
" let g:syntastic_warning_symbol = "⚠"
" let g:syntastic_python_checkers = ['pylint']
" let g:syntastic_go_checkers = ['gofmt', 'golint', 'gometalinter']
" let g:syntastic_javascript_checkers = ['eslint']
let g:multi_cursor_exit_from_visual_mode=0
let g:multi_cursor_exit_from_insert_mode=0
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlPMixed'
let g:ycm_add_preview_to_completeopt = 0
let g:ctrlp_prompt_mappings = {
\ 'AcceptSelection("h")': ['<c-h>', '<c-x>', '<c-cr>', '<c-s>'],
\ 'PrtCurLeft()':         ['<left>', '<c-^>'],
\ }
let g:jsx_ext_required = 0

let g:pymode_folding = 0
let g:pymode_lint = 0

let g:airline_theme='light'
let g:airline_powerline_fonts = 1

let g:qfenter_keymap = {}
let g:qfenter_keymap.vopen = ['<C-v>']
let g:qfenter_keymap.hopen = ['<C-CR>', '<C-h>']

let NERDTreeShowHidden=1

let g:prettier#autoformat = 0
let g:prettier#config#tab_width = 4
let g:prettier#config#trailing_comma = 'es5'
let g:prettier#config#parser = 'typescript'
let g:prettier#config#bracket_spacing = 'true'

set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc

nnoremap qq :q<CR>
noremap HH :sp<CR>:YcmCompleter GoTo<CR>
noremap HV :vsp<CR>:YcmCompleter GoTo<CR>
noremap Hh :YcmCompleter GoTo<CR>
nnoremap OO :NERDTreeToggle<CR> 
nnoremap TT <C-w>T
nmap <Leader>f <Plug>(easymotion-overwin-f2)
nmap f <Plug>(easymotion-s2)
nmap U *
nmap M #
map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>h <Plug>(easymotion-linebackward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
let g:EasyMotion_startofline = 0 " keep cursor column when JK motion
let NERDTreeQuitOnOpen=1
let g:EasyMotion_smartcase = 1
let g:EasyMotion_use_smartsign_us = 1
let g:EasyMotion_use_upper = 1
let g:EasyMotion_keys = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ;'
let g:EasyMotion_enter_jump_first = 1
let g:go_fmt_command = "goimports"
let g:go_list_type = "quickfix"

nnoremap <leader>a :Ack!<space>

noremap <C-G>b :GV!<CR>
noremap <C-G>s :Gstatus<CR>

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

nnoremap <silent> + :exe "resize " . ((winheight(0) * 3/2)+5)<CR>
nnoremap <silent> - :exe "resize " . (winheight(0) * 2/3)<CR>
nnoremap <silent> <C-c> :exe "vertical resize " . ((winwidth(0) * 3/2)+5)<CR>
nnoremap <silent> <C-m> :exe "vertical resize " . (winwidth(0) * 2/3)<CR>
nnoremap <silent> =c :exe "resize " . ((winheight(0) * 3/2)+5)<CR>:exe "vertical resize " . ((winwidth(0) * 3/2)+5)<CR>

vnoremap // y/\V<C-R>"<CR>
vnoremap <Leader>// y:Ack! <C-R>=fnameescape(@")<CR><CR>

inoremap {<CR>  {<CR>}<Esc>O

inoremap II <Esc>I
inoremap AA <Esc>A
inoremap fj <Esc>
vnoremap fj <Esc>
vmap s <Plug>VSurround

autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

function! s:incsearch_config(...) abort
  return incsearch#util#deepextend(deepcopy({
  \   'modules': [incsearch#config#easymotion#module({'overwin': 1})],
  \   'keymap': {
  \     "\<CR>": '<Over>(easymotion)'
  \   },
  \   'is_expr': 0
  \ }), get(a:, 1, {}))
endfunction

nnoremap <silent><expr> <SPACE>/  incsearch#go(<SID>incsearch_config())
noremap <silent><expr> ?  incsearch#go(<SID>incsearch_config({'command': '?'}))

function! s:config_easyfuzzymotion(...) abort
  return extend(copy({
  \   'converters': [incsearch#config#fuzzyword#converter()],
  \   'modules': [incsearch#config#easymotion#module({'overwin': 1})],
  \   'keymap': {"\<CR>": '<Over>(easymotion)'},
  \   'is_expr': 0,
  \   'is_stay': 1
  \ }), get(a:, 1, {}))
endfunction

nnoremap <silent><expr> / incsearch#go(<SID>config_easyfuzzymotion())

if &diff
    highlight DiffAdd    cterm=bold ctermfg=15 ctermbg=28 gui=none guifg=bg guibg=Red
    highlight DiffDelete cterm=bold ctermfg=15 ctermbg=124 gui=none guifg=bg guibg=Red
    highlight DiffChange cterm=bold ctermfg=15 ctermbg=26 gui=none guifg=bg guibg=Red
    highlight DiffText   cterm=bold ctermfg=10 ctermbg=88 gui=none guifg=bg guibg=Red
endif

if executable('ag')
  " Use ag over grep
  "let g:ackprg = 'ag --vimgrep'
  "set grepprg=ag\ --nogroup\ --nocolor
  let g:ackprg = 'ag --nogroup --nocolor --column'

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

nnoremap K *:Ack! "<C-R><C-W>"<CR>
nnoremap KK *:Ack! "<C-R><C-W>"<CR>

if filereadable(expand("~/.vimrc_background"))
  source ~/.vimrc_background
endif
