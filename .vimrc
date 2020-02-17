""""""""""""""""""""""""""""""""""""""""""""Vundle环境设置"""""""""""""""""""""""""""""""""""""""""""""""""""""
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
" vundle 管理的插件列表必须位于 vundle#begin() 和 vundle#end() 之间
call vundle#begin()

"避免PluginClean把自己卸载了                                                                                
Plugin 'VundleVim/Vundle.vim'  

"配置nerdtree插件
Plugin 'scrooloose/nerdtree'
map <F2> :NERDTreeMirror<CR>
map <F2> :NERDTreeToggle<CR>

"autocmd vimenter * NERDTree  "自动开启Nerdtree
"let g:NERDTreeWinSize = 25 "设定 NERDTree 视窗大小
"开启/关闭nerdtree快捷键
map <C-f> :NERDTreeToggle<CR>
"let NERDTreeShowBookmarks=1  " 开启Nerdtree时自动显示Bookmarks
"打开vim时如果没有文件自动打开NERDTree
autocmd vimenter * if !argc()|NERDTree|endif
"当NERDTree为剩下的唯一窗口时自动关闭
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
"设置树的显示图标
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let NERDTreeIgnore = ['\.pyc$']  " 过滤所有.pyc文件不显示
"let g:NERDTreeShowLineNumbers=1  " 是否显示行号
let g:NERDTreeHidden=0     "不显示隐藏文件
"Making it prettier
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

"实时显示符号定义插件
Plugin 'vim-scripts/taglist.vim'

""""""taglist""""""""
"ctags位于PATH目录下,所以可以省略具体路径
let Tlist_Ctags_Cmd='ctags'
"不同时显示多个文件的tag，只显示当前文件的
let Tlist_Show_One_File=1
"设置taglist的宽度
let Tlist_WinWidth =40
"如果taglist窗口是最后一个窗口，则退出vim
let Tlist_Exit_OnlyWindow=1
"在右侧窗口中显示taglist窗口
let Tlist_Use_Right_Window=1
"在左侧窗口中显示taglist窗口
"let Tlist_Use_Left_Windo =1  
"启动vim后自动打开
 let Tlist_Auto_Open=0
"打开关闭Taglist
map <F3> :TlistToggle<CR>
"按F5重新生成ctags
"-R:表示递归创建，也就是包括源代码根目录(当前目录)下的所有子目录
"--c++kinds=+ps是为c/c++语言添加函数原型信息
"--fields=+iaS是为标签添加继承信息(inheritance),访问控制信息(access)和函数特征(Signature)如参数表或原型等
"extra=+q是为类成员添加标签
map <F5> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q<CR>

"添加当前工程目录到vimrc下
"set tags+= "/home/matteo/linux/IMX6ULL/Board_Drivers/2_leds"
"添加cscope当前工程的路径
"cs add /home/matteo/linux/IMX6ULL/Board_Drivers/2_leds
if filereadable("cscope.out")
  cs add cscope.out
endif

"附cscope常用的命令：
"      ：cs find s ---- 查找C语言符号，即查找函数名、宏、枚举值等出现的地方
"      　　：cs find g ----
"      查找函数、宏、枚举等定义的位置，类似ctags所提供的功能
"      　　：cs find d ---- 查找本函数调用的函数：cs find c ----
"      查找调用本函数的函数
"      　　：cs find t: ---- 查找指定的字符串
"      　　：cs find e ---- 查找egrep模式，相当于egrep功能，但查找速度快多了
"      　　：cs find f ---- 查找并打开文件，类似vim的find功能
"      　　：cs find i ---- 查找包含本文件的文

if has("cscope")
            set cscopetag   " 使支持用 Ctrl+]  和 Ctrl+t 快捷键在代码间跳来跳去
            " check cscope for definition of a symbol before checking ctags:
            " set to 1 if you want the reverse search order.
             set csto=1

             " add any cscope database in current directory
             if filereadable("cscope.out")
                 cs add cscope.out
             " else add the database pointed to by environment variable
             elseif $CSCOPE_DB !=""
                 cs add $CSCOPE_DB
             endif

             " show msg when any other cscope db added
             set cscopeverbose

             nmap <C-/>s :cs find s <C-R>=expand("<cword>")<CR><CR>
             nmap <C-/>g :cs find g <C-R>=expand("<cword>")<CR><CR>
             nmap <C-/>c :cs find c <C-R>=expand("<cword>")<CR><CR>
             nmap <C-/>t :cs find t <C-R>=expand("<cword>")<CR><CR>
             nmap <C-/>e :cs find e <C-R>=expand("<cword>")<CR><CR>
             nmap <C-/>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
             nmap <C-/>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
             nmap <C-/>d :cs find d <C-R>=expand("<cword>")<CR><CR>
endif

Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
"使用Latex数学公式
let g:vim_markdown_math=1
"自动在当前光标生成目录的插件
Plugin 'mzlogin/vim-markdown-toc'
"在当前光标后生成目录
":GenTocMarked
"更新目录
":UpdateToc
"取消存储时自动更新目录
"let g:vmt_auto_update_on_save=0
"自动找到较低层次的目录,然后删除之
"function RToc()
"  exe "/-toc .* -->"
"  let lstart=line('.')
"  exe "/-toc -->"
"  let lnum=line('.')
"  execute lstart.",".lnum."g/           /d"
"endfunction

Plugin 'iamcco/mathjax-support-for-mkdp'
Plugin 'iamcco/markdown-preview.vim'


let g:mkdp_path_to_chrome = "firefox"
    " 设置 chrome 浏览器的路径（或是启动 chrome（或其他现代浏览器）的命令）
    " 如果设置了该参数, g:mkdp_browserfunc 将被忽略

"let g:mkdp_browserfunc = 'MKDP_browserfunc_default'
    " vim 回调函数, 参数为要打开的 url

let g:mkdp_auto_start = 0
    " 设置为 1 可以在打开 markdown 文件的时候自动打开浏览器预览，只在打开
    " markdown 文件的时候打开一次

let g:mkdp_auto_open = 0
    " 设置为 1 在编辑 markdown 的时候检查预览窗口是否已经打开，否则自动打开预
    " 览窗口

let g:mkdp_auto_close = 1
    " 在切换 buffer 的时候自动关闭预览窗口，设置为 0 则在切换 buffer 的时候不
    " 自动关闭预览窗口

let g:mkdp_refresh_slow = 0
    " 设置为 1 则只有在保存文件，或退出插入模式的时候更新预览，默认为 0，实时
    " 更新预览

let g:mkdp_command_for_global = 0
    " 设置为 1 则所有文件都可以使用 MarkdownPreview 进行预览，默认只有 markdown
    " 文件可以使用改命令

let g:mkdp_open_to_the_world = 0
    " 设置为 1, 在使用的网络中的其他计算机也能访问预览页面
    " 默认只监听本地（127.0.0.1），其他计算机不能访问


nmap <silent> <F8> <Plug>MarkdownPreview        " 普通模式
imap <silent> <F8> <Plug>MarkdownPreview        " 插入模式
nmap <silent> <F9> <Plug>StopMarkdownPreview    " 普通模式
imap <silent> <F9> <Plug>StopMarkdownPreview    " 插入模式

" 插件列表结束
call vundle#end()
filetype plugin indent on

"安装插件，先找到其在 github.com 的地址，再将配置信息其加入 .vimrc   "中的call vundle#begin() 和 call vundle#end() 之间，最后进入 vim 执行
":PluginInstall 便可自动安装

"要卸载插件，先在 .vimrc 中注释或者删除对应插件配置信息，然后在 vim  "中执行:PluginClean 便可卸载对应插件

"批量更新，只需执行:PluginUpdate

""""""""""""""""""""""""""""""""""""""""""""VIM基本配置"""""""""""""""""""""""""""""""""""""""""""""""""""""
" 定义快捷键的前缀，即<Leader>
let mapleader=","
"开启文件类型检测
filetype on        
"根据检测到的类型加载不同的插件    
filetype plugin on      

"让配置文件的更改立即生效
autocmd BufWritePost ${MYVIMRC} source ${MYVIMRC}  

 " 使用鼠标
set mouse=a 
 " 开启实时搜索功能
set incsearch                                 
 " 搜索时大小写不敏感
set ignorecase  
" 高亮显示搜索结果
set hlsearch         
 " 关闭兼容模式                         
set nocompatible   
 " vim 自身命令行模式智能补全                      
set wildmenu   
 
" 总是显示状态栏
set laststatus=2
" 显示光标当前位置
set ruler
" 开启行号显示
set number
" 高亮显示当前行/列
set cursorline
set cursorcolumn

" 开启语法高亮功能
syntax enable
" 允许用指定语法高亮配色方案替换默认方案
syntax on         

" 自适应不同语言的智能缩进
filetype indent on
" 将制表符扩展为空格
set expandtab
" 设置编辑时制表符占用空格数
set tabstop=4
" 设置格式化时制表符占用空格数
set shiftwidth=2
" 让 vim 把连续数量的空格视为一个制表符
set softtabstop=4
 
" 基于缩进或语法进行代码折叠
"set foldmethod=indent
set foldmethod=syntax
" 启动 vim 时关闭折叠代码
set nofoldenable          
"za，打开或关闭当前折叠；zM，关闭所有折叠；zR，打开所有折叠

"快速保存
nnoremap <leader>w :w<CR>


""""""""""""""""""""""""""""""""""""""""""""VIM基本配置"""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd Filetype markdown inoremap ,f <ESC>/<++><CR>:nohlsearch<CR>c4l
autocmd Filetype markdown inoremap ,b **** <++><ESC>F*hi
autocmd Filetype markdown inoremap ,n ---<Enter><Enter>
autocmd Filetype markdown inoremap ,s ~~~~ <++><ESC>F~hi
autocmd Filetype markdown inoremap ,i ** <++><ESC>F*i
autocmd Filetype markdown inoremap ,d `` <++><ESC>F`i
autocmd Filetype markdown inoremap ,c ```<Enter><++><Enter>```<Enter><Enter><++><ESC>4kA

