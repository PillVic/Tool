"Vim的配置文件


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



"输入设定

set backspace=2                  "随时可用退格键删除
set autoindent                   "自动缩进
set smartindent                  "换行时智能缩进

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



