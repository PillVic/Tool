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
set laststatus=2                                                            "显示状态栏
set number                                                                  "在每一行前面显示行号
set hlsearch                                                                "搜索时高亮度显示被找到文本
set background=dark                                                         "显示不同的底色色调
syntax on                                                                   "语法高亮
let python_highlight_all=1                                                  "Python语法高亮
set cursorline                                                              "突出显示当前行
set columns=45                                                              "每页显示的列数
     "配色方案设定
     set t_Co=256                "开启256色
     colorscheme zenburn 
     set bg=dark
"代码折叠
set foldmethod=indent            "根据缩进来进行代码折叠
set foldlevel=99
    "使用空格键来代码折叠
    nnoremap<space> za


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
Plugin 'nvie/vim-flake8'                                               "安装PEP8语法检查插件
Plugin 'scrooloose/nerdtree'                                           "安装文件浏览树形结构插件
Plugin 'kien/ctrlp.vim'                                                "安装超级搜索插件，快捷键ctrl+P即能搜索文件
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}        "安装状态栏插件
Plugin 'Valloric/YouCompleteMe'                                        "安装自动补全插件
       "针对YouCompleteMe进行设置
       let g:ycm_global_ycm_extra_conf='~/.ycm_extra_conf.py'
            "打开vim时不再询问是否加载ycm_extra_conf.py配置
       let g:ycm_confirm_extra_conf=0
       set completeopt=longest,menu
       let g:ycm_seed_identifiers_with_syntax=1       "开启语义补全
       let g:ycm_min_num_of_chars_for_completion=2    "开始补全的字符数
Plugin 'tpope/vim-fugitive'                                            "安装GIT集成工具




