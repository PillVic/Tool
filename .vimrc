"Vim的配置文件

    "针对拓展管理器插件Vundle进行配置
 
    set nocompatible              " required
    filetype off                  " required

    "set the runtime path to include Vundle and initialize
    set rtp+=~/.vim/bundle/Vundle.vim
    call vundle#begin()
    " alternatively, pass a path where Vundle should install plugins
    "call vundle#begin('~/some/path/here')
    " let Vundle manage Vundle, required
    Plugin 'gmarik/Vundle.vim'
    " Add all your plugins here (note older versions of Vundle used Bundle instead of Plugin)
    " All of your Plugins must be added before the following line
     call vundle#end()            " required
     filetype plugin indent on    " required
     set shortmess=a
     set cmdheight=2
"编码设定

set encoding=utf-8              "默认编码为utf-8       

 
"搜索设置

set magic                    "搜索开启正则表达式
set hlsearch                 "搜索时高亮度显示被找到文本
set noic                     "搜索时不忽略大小写


"外观设定
    "状态查看
    set ruler                        "显示最后一行的状态
    set showcmd
    set showmode                     "左下角那一行的状态
    set laststatus=2                 "显示状态栏

colorscheme   default                "设定配色方案
set nu                           "在每一行前面显示行号
set bg=dark                      "显示不同的底色色调
syntax on                        "语法高亮
set cursorline                   "突出显示当前行
	"括号染色设置 
	let g:rbpt_colorpairs = [
	    \ ['brown',       'RoyalBlue3'],
	    \ ['Darkblue',    'SeaGreen3'],
	    \ ['darkgray',    'DarkOrchid3'],
	    \ ['darkgreen',   'firebrick3'],
	    \ ['darkcyan',    'RoyalBlue3'],
	    \ ['darkred',     'SeaGreen3'],
	    \ ['darkmagenta', 'DarkOrchid3'],
	    \ ['brown',       'firebrick3'],
	    \ ['gray',        'RoyalBlue3'],
	    \ ['black',       'SeaGreen3'],
	    \ ['darkmagenta', 'DarkOrchid3'],
	    \ ['Darkblue',    'firebrick3'],
	    \ ['darkgreen',   'RoyalBlue3'],
	    \ ['darkcyan',    'SeaGreen3'],
	    \ ['darkred',     'DarkOrchid3'],
	    \ ['red',         'firebrick3'],
	    \ ]
	let g:rbpt_max = 16          "设置最大括号匹配数
	let g:rbpt_loadcmd_toggle = 0
	    "设置自动开启括号染色
	    au VimEnter * RainbowParenthesesToggle
	    au Syntax * RainbowParenthesesLoadRound
	    au Syntax * RainbowParenthesesLoadSquare
	    au Syntax * RainbowParenthesesLoadBraces
	
"代码折叠

set foldmethod=indent            "根据每行的缩进来进行代码折叠
nnoremap <space> za             "使用空格键进行代码折叠


"输入设定

set backspace=2                  "随时可用退格键删除
set autoindent                   "自动缩进
set smartindent                  "换行时智能缩进
set shiftwidth=4                 "设置缩进为4个空格 
imap <tab> <C-n>

    "针对lisp括号输入过多，使用[]替代"
    autocmd BufNewFile,BufRead *.lisp imap [ (
    autocmd BufNewFile,BufRead *.lisp imap ] )

"分割布局

set splitbelow
set splitright                
    "使用快捷键crlt+Vim标准移动键实现布局切换
     nnoremap <C-J> <C-W><C-J>
     nnoremap <C-K> <C-W><C-K>         
     nnoremap <C-L> <C-W><C-L>
     nnoremap <C-H> <C-W><C-H>


     
"安装插件

Plugin 'tmhedberg/SimpylFold'                                          "安装自动缩进插件
Plugin 'scrooloose/nerdtree'                                           "安装文件浏览树形结构插件
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}        "安装状态栏插件
Plugin 'tpope/vim-fugitive'                                            "安装GIT集成工具
Plugin 'PillVic/rainbow_parentheses.vim'                               "安装括号染色插件

