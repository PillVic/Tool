"Vim的配置文件

"编码设定
set encoding=utf-8              "默认编码为utf-8       

"搜索设置
set magic                       "搜索开启正则表达式
set hlsearch                    "搜索时高亮度显示被找到文本
set noic                        "搜索时不忽略大小写
"反斜杠取消搜索结果高亮
nnoremap \ :nohl<enter>

"外观设定
    "状态查看
    set ruler                        "显示最后一行的状态
    set showcmd
    set showmode                     "左下角那一行的状态
    set laststatus=2                 "显示状态栏
colorscheme   dante              "设定配色方案
set nu                           "在每一行前面显示行号
set  relativenumber              "设置相对行号
set bg=dark                      "显示不同的底色色调
syntax on                        "语法高亮
set cursorline                   "突出显示当前行
set wildmenu                     "命令行自动补全

"代码折叠
set foldmethod=indent            "根据每行的缩进来进行代码折叠
"折叠/展开部分
nnoremap ` za
"折叠全部
nnoremap . zM
"展开全部
nnoremap = zR
"正常模式t打开coc-explorer
nnoremap t :CocCommand explorer <enter>

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
set directory=~/.vim/swapfiles
nnoremap W :w<enter>
nnoremap Q :q<enter>
"设置回车键为命令模式
nnoremap <enter> :
"设置 m, J为自动设置当前行为屏幕中间
nnoremap m zz
nnoremap J zz
"设置K为将当前行为屏幕最后一行
nnoremap K zb
    "针对lisp括号输入过多，使用[]替代"
    autocmd BufNewFile,BufRead *.lisp imap [ (
    autocmd BufNewFile,BufRead *.lisp imap ] )
    autocmd BufNewFile,BufRead *.scm imap [ (
    autocmd BufNewFile,BufRead *.scm imap ] )
    autocmd BufNewFile,BufRead *.rkt imap [ (
    autocmd BufNewFile,BufRead *.rkt imap ] )
let g:autoformat_verbosemode=1

"记忆编辑位置
if has("autocmd")                                                          
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif 

"分割布局
set splitbelow
set splitright                
    "使用快捷键crlt+Vim标准移动键实现布局切换
     nnoremap <C-J> <C-W><C-J>
     nnoremap <C-K> <C-W><C-K>         
     nnoremap <C-L> <C-W><C-L>
     nnoremap <C-H> <C-W><C-H>

"多标签页控制
	"shift+H移到前一个标签页
	nnoremap <S-H> gT
	"shift+L移到后一个标签页
	nnoremap <S-L> gt

"安装插件
call plug#begin('~/.vim/plugged')
    "编译运行环境插件设置
    Plug 'tmhedberg/SimpylFold'                                          "安装自动缩进插件
    Plug 'skywind3000/asynctasks.vim'                                    "设置编译环境
    Plug 'skywind3000/asyncrun.vim'                                      "设置编译脚本
        let g:asyncrun_open = 6
        nnoremap <silent><f5> :AsyncTask file-run<cr>
        nnoremap <silent><f6> :AsyncTask reopen-file-run<cr>
        let g:asynctasks_term_pos = 'bottom'
        let g:asynctasks_term_rows = 7     "set the horizontal terminal split"
        let g:asynctasks_term_cols = 80     "set width for vertical terminal split
        let g:asynctasks_term_reuse = 1
Plug 'luochen1990/rainbow'                                           "括号染色插件
let g:rainbow_active = 1
Plug 'Yggdroot/indentLine'
Plug 'tpope/vim-fugitive'                                            "安装GIT集成工具
Plug 'solarnz/thrift.vim'
Plug 'vim-airline/vim-airline'                                       "安装airline状态栏插件
Plug 'Chiel92/vim-autoformat'                                        "安装格式化插件
Plug 'vim-airline/vim-airline-themes'				                 "airline主题配件
    "关于状态栏的小配置
    "状态栏的例子
    "Powerline setting
    let g:airline_theme='sol'
    let g:airline_powerline_fonts = 1
    let g:airline#extensions#tabline#enabled = 1

" Use release branch (recommend)
Plug 'neoclide/coc.nvim', {'branch': 'release'}
 "配置Coc (LSP插件)
    let g:coc_global_extensions = [
        \ 'coc-clangd',
        \ 'coc-sh',
        \ 'coc-pyright',
        \ 'coc-marketplace',
        \ 'coc-json',
        \ 'coc-sql',
        \ 'coc-xml',
        \ 'coc-explorer'
    \]

    " Use tab for trigger completion with characters ahead and navigate.
    " NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
    " other plugin before putting this into your config.
    inoremap <silent><expr> <TAB>
          \ coc#pum#visible() ? coc#pum#next(1):
          \ CheckBackspace() ? "\<Tab>" :
          \ coc#refresh()
    inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

    " Make <CR> to accept selected completion item or notify coc.nvim to format
    " <C-g>u breaks current undo, please make your own choice.
    inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                                  \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
    let g:copilot_no_tab_map = v:true
    imap <silent><script><expr> <C-y> copilot#Accept("\<CR>")
call plug#end()
