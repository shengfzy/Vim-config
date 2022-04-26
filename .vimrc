" Vimrc for matteo
" Author : shenkai
" Date   : 2022-4-23

" set number relativenumber 
set number
set nocompatible
set hidden
let mapleader = ","

" set search option
set hlsearch
set ignorecase
set incsearch

" use netrw
set nocp
filetype plugin on

"============================== start plugin ==============================
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

"begin vim-plug
call plug#begin()

"plug-in: fzf
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }

"plug-in: NERDTree
Plug 'preservim/nerdtree'

"plug-in: vim-rainbow
Plug 'frazrepo/vim-rainbow'

"Plug-in: YouCompleteMe
Plug 'Valloric/YouCompleteMe'

call plug#end()
"------------------------------ end plugin ------------------------------

"============================== config: fzf search ==============================
nnoremap <silent> <Leader>b :Buffers<CR>
nnoremap <silent> <C-p> :Files<CR>
nnoremap <silent> <Leader>f :Rg<CR>
nnoremap <silent> <Leader>/ :BLines<CR>
nnoremap <silent> <Leader>' :Marks<CR>
nnoremap <silent> <Leader>g :Commits<CR>
nnoremap <silent> <Leader>H :Helptags<CR>
nnoremap <silent> <Leader>hh :History<CR>
nnoremap <silent> <Leader>h: :History:<CR>
nnoremap <silent> <Leader>h/ :History/<CR>

" replace default grep with Rg
set grepprg=rg\ --vimgrep\ --smart-case\ --follow
"------------------------------ config: fzf end --------------------------------

"============================== config: NERDTree ==============================
"nnoremap <leader>n :NERDTreeFocus<CR>
"nnoremap <C-n> :NERDTree<CR>
nnoremap <F2> :NERDTreeToggle<CR>
"nnoremap <C-f> :NERDTreeFind<CR>
" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
"------------------------------ config: NERDTree end ---------------------------

"============================== Config: rainbow ==============================
let g:rainbow_active = 1

let g:rainbow_load_separately = [
    \ [ '*' , [['(', ')'], ['\[', '\]'], ['{', '}']] ],
    \ [ '*.tex' , [['(', ')'], ['\[', '\]']] ],
    \ [ '*.cpp' , [['(', ')'], ['\[', '\]'], ['{', '}']] ],
    \ [ '*.{html,htm}' , [['(', ')'], ['\[', '\]'], ['{', '}'], ['<\a[^>]*>', '</[^>]*>']] ],
    \ ]

let g:rainbow_guifgs = ['RoyalBlue3', 'DarkOrange3', 'DarkOrchid3', 'FireBrick']
let g:rainbow_ctermfgs = ['lightblue', 'lightgreen', 'yellow', 'red', 'magenta']
"------------------------------ config: rainbow end ---------------------------

"============================== Config: ctags/scope ==============================
"Generate tags and cscope.out from FileList.txt (c, cpp, h, hpp)
nmap <C-@> :!find -name "*.c" -o -name "*.cpp" -o -name "*.h" -o -name "*.hpp" > FileList.txt<CR>
                       \ :!ctags -L -< FileList.txt<CR>
                       \ :!cscope -bkq -i FileList.txt<CR>

if has("cscope")
    set csto=0
    set nocsverb
    " add any database in current directory
    if filereadable("cscope.out")
        cs add cscope.out
    endif
    set csverb
    "set cst  这两句会将cscope当作tag，当找不到时会卡住，因此注释掉
    "set cscopetag
endif

nmap zs :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap zg :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap zc :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap zt :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap ze :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap zf :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap zi :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap zd :cs find d <C-R>=expand("<cword>")<CR><CR>
"------------------------------ config: ctags end --------------------------------

"============================== Config: YCM ==============================
let g:ycm_show_diagnostics_ui = 0
let g:ycm_server_log_level = 'info'
let g:ycm_min_num_identifier_candidate_chars = 2
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_complete_in_strings=1
let g:ycm_key_invoke_completion = ''

let g:ycm_semantic_triggers = {
\ 'c,cpp,python': ['re!\w{2}'],
\ 'cs,lua,javascript': ['re!\w{2}'],
\ }

let g:ycm_global_ycm_extra_conf='~/.vim/plugged/YouCompleteMe/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf = 0
set backspace=indent,eol,start

highlight PMenu ctermfg=0 ctermbg=255 guifg=black guibg=Grey93
highlight PMenuSel ctermfg=255 ctermbg=0 guifg=Grey93 guibg=black
"------------------------------ config: YCM  --------------------------------

"============================== User keyboard mapping ==============================
nnoremap <silent> <up> :cp<CR>
nnoremap <silent> <down> :cn<CR>
nnoremap <esc><esc> :noh<return><esc>
inoremap jj <esc>
