set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

Plugin 'Valloric/YouCompleteMe'
Plugin 'tpope/vim-surround'
Plugin 'scrooloose/syntastic'
Plugin 'haya14busa/incsearch.vim'
Plugin 'haya14busa/incsearch-fuzzy.vim'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'haya14busa/incsearch-easymotion.vim'
Plugin 'vim-scripts/mru.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'kien/ctrlp.vim'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'bling/vim-airline'
Plugin 'leafgarland/typescript-vim'
set laststatus=2
Plugin 'vim-airline/vim-airline-themes'
Plugin 'pangloss/vim-javascript'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-fugitive'
Plugin 'mileszs/ack.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

"source $VIMRUNTIME/vimrc_example.vim
behave xterm

set ruler
set ignorecase
set smartcase
set hlsearch
set incsearch
set showmatch
set cindent

set guicursor+=n-c:blinkon1

syntax enable
colorscheme desert 

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

autocmd FileType typescript setlocal shiftwidth=2 tabstop=2
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2
autocmd FileType html setlocal shiftwidth=2 tabstop=2
autocmd FileType jinja setlocal shiftwidth=2 tabstop=2
autocmd FileType scss setlocal shiftwidth=2 tabstop=2

" Config
let g:syntastic_python_pylint_args = '--rcfile=~/.pylintrc' 
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 1
let g:syntastic_error_symbol = "✗"
let g:syntastic_warning_symbol = "⚠"
let g:syntastic_python_checkers = ['pylint']
let g:multi_cursor_exit_from_visual_mode=0
let g:multi_cursor_exit_from_insert_mode=0
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlPMixed'
let g:ycm_add_preview_to_completeopt = 0
let g:ctrlp_prompt_mappings = {
\ 'AcceptSelection("h")': ['<c-h>', '<c-x>', '<c-cr>', '<c-s>'],
\ 'PrtCurLeft()':         ['<left>', '<c-^>'],
\ }

let g:airline_theme='light'
let g:airline#extensions#tabline#enabled = 1
let mapleader = ","

set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc

map HH :sp<CR>:YcmCompleter GoTo<CR>
map Hh :YcmCompleter GoTo<CR>
map OO :NERDTreeToggle<CR> 
nmap f <Plug>(easymotion-overwin-f2)
nmap <space>f <Plug>(easymotion-s2)
nmap U *
nmap M #
"nmap  / <Plug>(easymotion-sn)
map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>h <Plug>(easymotion-linebackward)
let g:EasyMotion_startofline = 0 " keep cursor column when JK motion
let NERDTreeQuitOnOpen=1
let g:EasyMotion_smartcase = 1
let g:EasyMotion_use_smartsign_us = 1
let g:EasyMotion_use_upper = 1
let g:EasyMotion_keys = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ;'
let g:EasyMotion_enter_jump_first = 1

nnoremap <leader>a :Ack!<space>

nnoremap <C-G>b :Gblame<CR>
nnoremap <C-G>s :Gstatus<CR>

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

nnoremap <silent> + :exe "resize " . ((winheight(0) * 3/2)+5)<CR>
nnoremap <silent> - :exe "resize " . (winheight(0) * 2/3)<CR>
nnoremap <silent> <C-c> :exe "vertical resize " . ((winwidth(0) * 3/2)+5)<CR>
nnoremap <silent> <C-m> :exe "vertical resize " . (winwidth(0) * 2/3)<CR>
nnoremap <silent> =c :exe "resize " . ((winheight(0) * 3/2)+5)<CR>:exe "vertical resize " . ((winwidth(0) * 3/2)+5)<CR>

vnoremap // y/<C-R>"<CR>"

inoremap {<CR>  {<CR>}<Esc>O

inoremap II <Esc>I
inoremap AA <Esc>A
inoremap fj <Esc>
vnoremap fj <Esc>
vmap s <Plug>VSurround

autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

autocmd CursorMoved * call ToggleHighlight()
map <F8> :call ToggleHighlight(1)<CR>

let g:toggleHighlight = 0
function! ToggleHighlight(...)
    if a:0 == 1 "toggle behaviour
        let g:toggleHighlight = 1 - g:toggleHighlight
    endif

    if g:toggleHighlight == 0 "normal action, do the hi
        silent! exe printf('match WarningMsg /\<%s\>/', expand('<cword>'))
    else
    endif
endfunction

function! s:incsearch_config(...) abort
  return incsearch#util#deepextend(deepcopy({
  \   'modules': [incsearch#config#easymotion#module({'overwin': 1})],
  \   'keymap': {
  \     "\<CR>": '<Over>(easymotion)'
  \   },
  \   'is_expr': 0
  \ }), get(a:, 1, {}))
endfunction

noremap <silent><expr> <SPACE>/  incsearch#go(<SID>incsearch_config())
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

noremap <silent><expr> / incsearch#go(<SID>config_easyfuzzymotion())

if &diff
    highlight DiffAdd    cterm=bold ctermfg=15 ctermbg=28 gui=none guifg=bg guibg=Red
    highlight DiffDelete cterm=bold ctermfg=15 ctermbg=124 gui=none guifg=bg guibg=Red
    highlight DiffChange cterm=bold ctermfg=15 ctermbg=26 gui=none guifg=bg guibg=Red
    highlight DiffText   cterm=bold ctermfg=10 ctermbg=88 gui=none guifg=bg guibg=Red
endif

if executable('ag')
  " Use ag over grep
  let g:ackprg = 'ag --vimgrep'
  "set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

nnoremap K :Ack! "<C-R><C-W>"<CR>

