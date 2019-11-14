syntax on

call plug#begin('~/.vim/plugged')

Plug 'w0rp/ale'
Plug 'Lokaltog/vim-easymotion'
Plug 'haya14busa/incsearch.vim'
Plug 'haya14busa/incsearch-fuzzy.vim'
Plug 'haya14busa/incsearch-easymotion.vim'
Plug 'scrooloose/nerdtree'
Plug 'kien/ctrlp.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'terryma/vim-multiple-cursors'
Plug 'itchyny/lightline.vim'
Plug 'mxw/vim-jsx'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-fugitive'
Plug 'mileszs/ack.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'junegunn/gv.vim'
Plug 'ap/vim-css-color'
Plug 'jkerian/HiCursorWords'
Plug 'yssl/QFEnter'
Plug 'tpope/vim-rhubarb'
Plug 'suan/vim-instant-markdown'
Plug 'prettier/vim-prettier'
Plug 'chriskempson/base16-vim'
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'ryanolsonx/vim-lsp-typescript'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'sheerun/vim-polyglot'
Plug 'blueyed/vim-diminactive'
Plug 'airblade/vim-gitgutter'
Plug 'neoclide/coc.nvim', {'tag': '*', 'do': './install.sh'}

call plug#end()

set nobackup
set nowritebackup
set laststatus=2
set encoding=utf-8
set ignorecase
set smartcase
set hlsearch
set incsearch
set showmatch
set cindent
set updatetime=250

set expandtab
set smarttab
set shiftwidth=4
set tabstop=4

set wrap
set autoread

set backspace=2
set pastetoggle=<F3>

set diffopt+=vertical
set completeopt+=preview

let mapleader = "\<Space>"

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
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Config
let g:ale_sign_error = "✗"
let g:ale_sign_warning = "⚠"
let g:ale_linters = {
    \ 'go': ['gofmt', 'golint', 'go vet', 'staticcheck'],
    \ 'javascript': ['eslint'],
    \ }
let g:lightline = {
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [ 'readonly', 'relativepath', 'modified' ] ]
      \ }
      \ }
let g:ale_lint_on_enter = 0
let g:ale_lint_on_save = 1

let g:lsp_diagnostics_enabled = 0
let g:lsp_highlight_references_enabled = 0
let g:lsp_highlights_enabled = 0
let g:lsp_textprop_enabled = 0

let g:multi_cursor_exit_from_visual_mode=0
let g:multi_cursor_exit_from_insert_mode=0

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlPMixed'
let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("h")': ['<c-h>', '<c-x>', '<c-cr>', '<c-s>'],
    \ 'PrtCurLeft()':         ['<left>', '<c-^>'],
    \ }

let g:qfenter_keymap = {}
let g:qfenter_keymap.vopen = ['<C-v>']
let g:qfenter_keymap.hopen = ['<C-CR>', '<C-h>']

let NERDTreeShowHidden=1
let NERDTreeQuitOnOpen=1

let g:EasyMotion_startofline = 0 " keep cursor column when JK motion
let g:EasyMotion_smartcase = 1
let g:EasyMotion_use_smartsign_us = 1
let g:EasyMotion_use_upper = 1
let g:EasyMotion_keys = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ;'
let g:EasyMotion_enter_jump_first = 1

let g:go_auto_type_info = 0
let g:go_fmt_command = "goimports"
let g:go_list_type = "quickfix"

let g:github_enterprise_urls = ['https://github.asapp.dev']

set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc

nnoremap qq :q<CR>
nnoremap OO :NERDTreeToggle<CR> 
nnoremap TT <C-w>T
nnoremap <leader>a :Ack!<space>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap U *
nnoremap M #
nnoremap <silent> + :exe "resize " . ((winheight(0) * 3/2)+5)<CR>
nnoremap <silent> - :exe "resize " . (winheight(0) * 2/3)<CR>
nnoremap <silent> <C-c> :exe "vertical resize " . ((winwidth(0) * 3/2)+5)<CR>
nnoremap <silent> <C-m> :exe "vertical resize " . (winwidth(0) * 2/3)<CR>
nnoremap <silent> =c :exe "resize " . ((winheight(0) * 3/2)+5)<CR>:exe "vertical resize " . ((winwidth(0) * 3/2)+5)<CR>
nnoremap KK :Ack! "<C-R><C-W>"<CR>

nnoremap HH :sp<CR>:LspDefinition<CR>
nnoremap HV :vsp<CR>:LspDefinition<CR>
nnoremap HI :LspImplementation<CR>
nnoremap Hh :LspDefinition<CR>

noremap <C-G>b :GV!<CR>
noremap <C-G>s :Gstatus<CR>

nmap <Leader>f <Plug>(easymotion-overwin-f2)
nmap f <Plug>(easymotion-s2)
nmap <Leader>l <Plug>(easymotion-lineforward)
nmap <Leader>h <Plug>(easymotion-linebackward)
nmap <Leader>j <Plug>(easymotion-j)
nmap <Leader>k <Plug>(easymotion-k)

vnoremap fj <Esc>
vnoremap // y/\V<C-R>"<CR>
vnoremap <Leader>// y:Ack! <C-R>=fnameescape(@")<CR><CR>

inoremap {<CR>  {<CR>}<Esc>O
inoremap II <Esc>I
inoremap AA <Esc>A
inoremap fj <Esc>
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

function! s:incsearch_config(...) abort
  return incsearch#util#deepextend(deepcopy({
  \   'modules': [incsearch#config#easymotion#module({'overwin': 0})],
  \   'keymap': {"\<CR>": '<Over>(easymotion)'},
  \   'is_expr': 0,
  \   'is_stay': 1
  \ }), get(a:, 1, {}))
endfunction

nnoremap <silent><expr> <SPACE>/  incsearch#go(<SID>incsearch_config())
noremap <silent><expr> ?  incsearch#go(<SID>incsearch_config({'command': '?'}))

function! s:config_easyfuzzymotion(...) abort
  return extend(copy({
  \   'converters': [incsearch#config#fuzzyword#converter()],
  \   'modules': [incsearch#config#easymotion#module({'overwin': 0})],
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

if filereadable(expand("~/.vimrc_background"))
  source ~/.vimrc_background
endif

if executable('gopls')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'gopls',
        \ 'cmd': {server_info->['gopls', '-mode', 'stdio']},
        \ 'whitelist': ['go'],
        \ })
endif

"if executable('go-langserver')
  "au User lsp_setup call lsp#register_server({
      "\ 'name': 'go-langserver',
      "\ 'cmd': {server_info->['go-langserver', '-gocodecompletion']},
      "\ 'whitelist': ['go'],
      "\ })
"else
  "echohl ErrorMsg
  "echom 'Sorry, `go-langserver` is not installed.'
  "echohl NONE
"endif

