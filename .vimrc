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
"编码设定
set encoding=utf-8              "默认编码为utf-8       

 
"状态查看
set ruler                        "显示最后一行的状态
set showmode                     "左下角那一行的状态


"外观设定
colorscheme  slate               "设定配色方案
set nu                           "在每一行前面显示行号
set hlsearch                     "搜索时高亮度显示被找到文本
set bg=dark                      "显示不同的底色色调
syntax on                        "语法高亮
set cursorline                   "突出显示当前行
set laststatus=2                 "显示状态栏

"代码折叠
set foldmethod=indent            "根据每行的缩进来进行代码折叠
set foldclose                    "光标离开后取消折叠
    "使用空格键进行代码折叠
    nnoremap <space> za               


"输入设定

set backspace=2                  "随时可用退格键删除
set autoindent                   "自动缩进
set smartindent                  "换行时智能缩进


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
















