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

autocmd vimenter * NERDTree  "自动开启Nerdtree
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
 let Tlist_Auto_Open=1

" 插件列表结束
call vundle#end()
filetype plugin indent on

"安装插件，先找到其在 github.com 的地址，再将配置信息其加入 .vimrc   "中的call vundle#begin() 和 call vundle#end() 之间，最后进入 vim 执行
":PluginInstall 便可自动安装

"要卸载插件，先在 .vimrc 中注释或者删除对应插件配置信息，然后在 vim  "中执行:PluginClean 便可卸载对应插件

"批量更新，只需执行:PluginUpdate

""""""""""""""""""""""""""""""""""""""""""""VIM基本配置"""""""""""""""""""""""""""""""""""""""""""""""""""""
" 定义快捷键的前缀，即<Leader>
let mapleader=";"
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
