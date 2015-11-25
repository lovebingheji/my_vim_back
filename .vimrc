
" Session 
set sessionoptions-=curdir
set sessionoptions+=sesdir


"禁用方向键
"map <UP> <NOP>
"map <DOWN> <NOP>
"map <LEFT> <NOP>
"map <RIGHT> <NOP>
"inoremap <UP> <NOP>
"inoremap <DOWN> <NOP>
"inoremap <LEFT> <NOP>
"inoremap <RIGHt> <NOP>

"<leader> 可以使用let mapleader = 来设置
"其值，默认<leader>为\
map <leader>n <plug>NERDTreeTabsToggle <CR>         "设置打开目录树的快捷键
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
"Plugin 'Valloric/YouCompleteMe'
"Plugin 'gmarik/Vundle.vim'
"Plugin 'tpope/vim-fugitive'
"Plugin 'L9'
"Plugin 'git://git.wincent.com/command-t.git'
"Plugin 'file:///home/gmarik/path/to/plugin'
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
"Plugin 'user/L9', {'name': 'newL9'}
"Plugin 'easyMotion'
"Plugin 'ctrlp.vim'
"Plugin 'ZenCoding.vim'
"Plugin 'snipMate'
"Plugin 'AutoClose'
"Bundle 'https://github.com/marijnh/tern_for_vim.git'
""Plugin 'lint.vim'
call vundle#end()    


"easymotion
let g:EasyMotion_leader_key= '\'

"set guifont
set guifont=Monaco:h16

" 高亮当前行
set cursorline
set nocursorcolumn

" 使用非兼容模式
set nocompatible  

" 设置文字编码自动识别
set fencs=utf-8,gb18030 

" 有关搜索的选项
set hls
set incsearch   
"set ic smartcase 

" 输入的命令显示出来
set showcmd

" 历史记录行数
set history=200

" 当文件在外部被修改时，自动读取
set autoread 

" 一直启动鼠标
set mouse=

" 设置mapleader
let mapleader = ";"
let g:mapleader = ";"

" 快速重载配置文件
map <leader>s :source ~/.vimrc<cr> 
map <leader>e :e! ~/.vimrc<cr>

" 当.vimrc被修改时，重载之
autocmd! bufwritepost vimrc source ~/.vimrc 

" 自动跳转到上一次打开的位置
autocmd BufReadPost *
			\ if line("'\"") > 0 && line ("'\"") <= line("$") |
			\ exe "normal! g'\"" |
			\ endif 

"set background=dark

" 设置vim的本色方案
"colorscheme spring
colorscheme breeze
"colorscheme  calmar256_dark

set t_Co=256

" 语法高亮
syntax on

" 字体
"set gfn=Vera\ Sans\ YuanTi\ Mono:h10
"set gfn=Droid\ Sans\ Fallback:h10

" GUI
if has("gui_running")
	set guioptions-=T
	let psc_style='cool'
endif 

" 折叠相关
set foldmethod=marker

" Tab缩进
set smarttab
set tabstop=4 
set expandtab 

" 自动缩进 
"set smartindent 
set shiftwidth=4
"set autoindent 
"set cindent 

" 显示行号
set number 

" 显示光标位置 
set ruler 

" wild菜,在命令模式下使用tab自动不全内容显示
set wildmenu 

" 上下移动时，留3行
set so=3

" set backspace
set backspace=eol,start,indent

" Backspace and cursor keys wrap to
set whichwrap+=<,>,h,l

" set magic on 
set magic 

"关闭错误信息响铃
set noerrorbells

"关闭使用可视铃声代替呼叫
set novisualbell

"置空错误铃声的终端代码
set vb t_vb=

" 括号匹配
set showmatch 

" How many tenths of a second to blink
set mat=2

" 状态栏
set laststatus=2
function! CurDir()
	let curdir = substitute(getcwd(), '/home/peter', "~/", "g")
	return curdir
endfunction
set statusline=\ %f%m%r%h\ %w\ %<CWD:\ %{CurDir()}\ %=Pos:\ %l/%L:%c\ %p%%\ 

" Smart way to move btw. windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" 命令窗口大小
set cmdheight=1

" 文件编码 
set fileencodings=ucs-bom,utf-8,gb2312,gbk,gb18030,big-5,ucs,latin1

"pathogen load
filetype off
execute pathogen#infect()
call pathogen#infect()
call pathogen#helptags()

" 启动文件类型插件
filetype on 
filetype plugin on 
filetype indent on
set completeopt=longest,menu

"javascript
"设置javascript支持html 和css
let javascript_enable_domhtmlcss=1
"设置字典(ctrl+x,ctrl+k)可以不全插入
"
autocmd FileType javascript set dictionary=~/.vim/dict/javascript.dict


"窗口风格时，进行切换的按键需要连续安两次
"比如从下方窗口移动光标到上方窗口，需要
"<c-w><c-w>k,现在将其冲映射为<c-k>
nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l


" 文件类型
set ffs=unix,dos
nmap <leader>fd :se ff=dos<cr>
nmap <leader>fu :se ff=unix<cr>

" 不备份文件
set nobackup
set nowritebackup

" 自动完成 
set completeopt=longest,menu

" for taglist
nmap tl :TlistToggle <CR> 
let Tlist_Show_One_File=1
let Tlist_Use_Right_Window=1
let Tlist_File_Fold_Auto_Close=1 

nmap <F9> :NERDTreeToggle <CR> 

" MiniBufExpl 
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1

nmap <F4> :MiniBufExplorer<cr> :UMiniBufExplorer<cr>

" SuperTab


" for AutoComplete
"let g:AutoComplPop_NotEnableAtStartup = 1
"nmap <F10> :AutoComplPopEnable
"nmap <C-F10> :AutoComplPopDisable

" for echofunc
set tags+=~/.vim/systags 
"nmap <M-F9> :!ctags --append=yes -f ~/.vim/systags --fields=+lS
"nmap <C-F9> :!ctags -R --fields=+lS
let g:EchoFuncLangsUsed = ["c", "cpp", "java"] 

"hi Mark ctermbg=Red ctermfg=Green 
"syntax region unKnown start='???' end='???'
"hi def link unKnown Mark
" Test line:  ??? >...< ???
"match Mark '???'
" Buffer 
set hidden
nmap <leader>bn :bn<cr>
nmap <leader>bp :bp<cr>
nmap <leader>bb :b#<cr> 
nmap <leader>bls :buffers<cr>
nmap <leader>b1 :b1<cr>
nmap <leader>b2 :b2<cr>
nmap <leader>b3 :b3<cr>
nmap <leader>b4 :b4<cr>
nmap <leader>b5 :b5<cr>
nmap <leader>b6 :b6<cr>
nmap <leader>b7 :b7<cr>
nmap <leader>b8 :b8<cr>
nmap <leader>b9 :b9<cr> 

"nmap <F3> :vimgrep <cword> **/*.cpp **/*.h<cr> :copen <cr>
"nmap <F3> mZ :grep -Rn <cword> **/*.cpp **/*.c **/*.h **/*.java 2>/dev/null<cr><cr> :copen <cr>
nmap <F3> mZ :grep -Rn <cword> ./ 2>/dev/null<cr><cr> :copen <cr> 
set grepformat=%f:%l:%m
"set grepprg=

"set indentLine
let g:indentLine_color_tty_light = 7
let g:indentLine_color_dark = 1
let g:indentLine_char = '┆'
let g:indentLine_loaded = 1
let g:indentLine_enabled = 1

let g:winManagerWindowLayout='FileExplorer|Taglist'
nmap wm :WMToggle<cr>

"vim markdown"
let g:vim_markdown_frontmatter=1
let g:vim_markdown_folding_disabled=0
autocmd BufNewFile,BufRead *.md set nofoldenable


set tags=tags;
set autochdir

",ch high light a col
map ,ch :call SetColorColumn()<CR>
    function! SetColorColumn()
        let col_num = virtcol(".")
        let cc_list = split(&cc, ',')
        if count(cc_list, string(col_num)) <= 0
            execute "set cc+=".col_num
        else
            execute "set cc-=".col_num
        endif
    endfunction




if has("cscope")
  set csprg=/usr/local/bin/cscope
  set csto=0
  set cst
  set csverb
  set cspc=3
  "add any database in current directory
  if filereadable("cscope.out")
      cs add cscope.out
  endif
endif

nmap <C-@>s :cs fine s <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-@>i :cs find i <C-R>=expand("<cfile>")<CR>$<CR>
nmap <C-@>d :cs find d <C-R>=expand("<cword>")<CR><CR>


