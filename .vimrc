"Vim的配置文件

"编码设定
set encoding=utf-8              "默认编码为utf-8       

"搜索设置
set magic                       "搜索开启正则表达式
set hlsearch                    "搜索时高亮度显示被找到文本
set noic                        "搜索时不忽略大小写

"外观设定
    "状态查看
    set ruler                        "显示最后一行的状态
    set showcmd
    set showmode                     "左下角那一行的状态
    set laststatus=2                 "显示状态栏
colorscheme   eva01              "设定配色方案
set nu                           "在每一行前面显示行号
set  relativenumber              "设置相对行号
set bg=dark                      "显示不同的底色色调
syntax on                        "语法高亮
set cursorline                   "突出显示当前行
set wildmenu                     "命令行自动补全
	
"代码折叠
set foldmethod=indent            "根据每行的缩进来进行代码折叠
"使用反斜杠键进行代码折叠
nnoremap \ za
nnoremap <tab> zR

"输入设定
set backspace=2                  "随时可用退格键删除
set autoindent                   "自动缩进
set smartindent                  "换行时智能缩进
inoremap <C-j> <ESC>
set shiftwidth=4                 "设置缩进为4个空格 
    "tab设置为4个空格
    set ts=4                     
    set expandtab                     
set undodir=~/.vim/undo-dir      "undo file save directory 	
set undofile                     "保存撤销历史
"设置<f8>为自动设置当前行为屏幕中间
nnoremap <f8> zz
    "针对lisp括号输入过多，使用[]替代"
    autocmd BufNewFile,BufRead *.lisp imap [ (
    autocmd BufNewFile,BufRead *.lisp imap ] )
    autocmd BufNewFile,BufRead *.scm imap [ (
    autocmd BufNewFile,BufRead *.scm imap ] )
    autocmd BufNewFile,BufRead *.rkt imap [ (
    autocmd BufNewFile,BufRead *.rkt imap ] )

let g:mapleader="\<Space>"
"let g:dashboard_default_executive ='Clap' or 'fzf' or 'telescope'
nmap <Leader>ss :<C-u>SessionSave<CR>
nmap <Leader>sl :<C-u>SessionLoad<CR>
nnoremap <silent> <Leader>fh :DashboardFindHistory<CR>
nnoremap <silent> <Leader>ff :DashboardFindFile<CR>
nnoremap <silent> <Leader>tc :DashboardChangeColorscheme<CR>
nnoremap <silent> <Leader>fa :DashboardFindWord<CR>
nnoremap <silent> <Leader>fb :DashboardJumpMark<CR>
nnoremap <silent> <Leader>cn :DashboardNewFile<CR>

"分割布局
set splitbelow
set splitright                
    "使用快捷键crlt+Vim标准移动键实现布局切换
     nnoremap <C-J> <C-W><C-J>
     nnoremap <C-K> <C-W><C-K>         
     nnoremap <C-L> <C-W><C-L>
     nnoremap <C-H> <C-W><C-H>
"多标签页控制
	"shift+J移到前一个标签页
	nnoremap <S-H> gT
	"shift+K移到后一个标签页
	nnoremap <S-L> gt

"安装插件
call plug#begin('~/.vim/plugged')
Plug 'tmhedberg/SimpylFold'                                          "安装自动缩进插件
Plug 'luochen1990/rainbow'
let g:rainbow_active = 1
Plug 'scrooloose/nerdtree'                                           "安装文件浏览树形结构插件
Plug 'tpope/vim-fugitive'                                            "安装GIT集成工具
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }                  "安装fzf
    "安装vim-clap
    Plug 'liuchengxu/vim-clap'
    " Build the extra binary if cargo exists on your system.
    Plug 'liuchengxu/vim-clap', { 'do': ':Clap install-binary' }
    " The bang version will try to download the prebuilt binary if cargo does not exist.
    Plug 'liuchengxu/vim-clap', { 'do': ':Clap install-binary!' }
    " :Clap install-binary[!] will always try to compile the binary locally,
    " if you do care about the disk used for the compilation, try using the force download way,
    " which will download the prebuilt binary even you have installed cargo.
    Plug 'liuchengxu/vim-clap', { 'do': { -> clap#installer#force_download() } }
    " `:Clap install-binary[!]` will run using the terminal feature which is inherently async.
    " If you don't want that and hope to run the hook synchorously:
    Plug 'liuchengxu/vim-clap', { 'do': has('win32') ? 'cargo build --release' : 'make' }
Plug 'glepnir/dashboard-nvim'                                        "安装dashboard
    let g:dashboard_default_executive ='clap'

Plug 'junegunn/fzf.vim'
Plug 'vim-airline/vim-airline'                                       "安装airline状态栏插件
Plug 'vim-airline/vim-airline-themes'				                 "airline主题配件
    "关于状态栏的小配置
    "状态栏的例子
    "Powerline setting
    let g:airline_theme='bubblegum'
    let g:airline_powerline_fonts = 1
    let g:airline#extensions#tabline#enabled = 1

" Use release branch (recommend)
Plug 'neoclide/coc.nvim', {'branch': 'release'}
 
"list the plug in coc
let g:coc_global_extensions = ['coc-clangd', 'coc-sh', 'coc-pyright', 'coc-marketplace']
" Use tab for trigger completion with characters ahead and navigate.
 " NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
 " other plugin before putting this into your config.
 inoremap <silent><expr> <TAB>
       \ pumvisible() ? "\<C-n>" :
       \ <SID>check_back_space() ? "\<TAB>" :
       \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

call plug#end()
