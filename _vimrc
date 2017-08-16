"修改vim 当前目录为e:\
cd e:\
set nocompatible
source $VIMRUNTIME/vimrc_example.vim
"source $VIMRUNTIME/mswin.vim
behave mswin

set diffexpr=MyDiff()
function! MyDiff()
    let opt = '-a --binary '
    if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
    if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
    let arg1 = v:fname_in
    if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
    let arg2 = v:fname_new
    if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
    let arg3 = v:fname_out
    if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
    let eq = ''
    if $VIMRUNTIME =~ ' '
        if &sh =~ '\<cmd'
            let cmd = '""' . $VIMRUNTIME . '\diff"'
            let eq = '"'
        else
            let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
        endif
    else
        let cmd = $VIMRUNTIME . '\diff'
    endif
    silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction


" -----------------------------------------------------------------------------
"  < Vundle 插件管理工具配置 >
" -----------------------------------------------------------------------------
    " 用于更方便的管理vim插件，具体用法参考 :h vundle 帮助
    " 安装方法为在终端输入如下命令
    " git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
    " 如果想在 windows 安装就必需先安装 "git for window"，可查阅网上资料
    filetype off
    
    "此处规定Vundle的路径
    set rtp+=$VIM/vimfiles/bundle/vundle/
    
    "此处规定插件的安装路径
    call vundle#rc('$VIM/vimfiles/')
    
    Bundle 'gmarik/vundle'
    Bundle 'JavaScript-syntax'
    Bundle 'jQuery'
    Bundle 'othree/html5.vim'
    Bundle 'groenewege/vim-less'
    Bundle 'Markdown'
    Bundle 'Markdown-syntax'
    Bundle 'php.vim-html-enhanced'
    Bundle 'pangloss/vim-javascript'
    Bundle 'Shougo/neocomplcache.vim'
    "树形目录管理
    Bundle 'scrooloose/nerdtree'   
    "快速开关注释 
    Bundle 'scrooloose/nerdcommenter'  
    "增强版状态栏
    Bundle 'Lokaltog/vim-powerline'   
    Bundle 'vimwiki'
    Bundle 'taglist.vim'
    Bundle 'posva/vim-vue'
    Bundle 'VimIM'
    Bundle 'maksimr/vim-jsbeautify'
    Bundle 'kien/ctrlp.vim'
    
    filetype plugin indent on

" -----------------------------------------------------------------------------
"  < 编码配置 >
" -----------------------------------------------------------------------------
" 注：使用utf-8格式后，软件与程序源码、文件路径不能有中文，否则报错
    set encoding=utf-8                                    "设置gvim内部编码
    set fileencoding=utf-8                                "设置当前文件编码
    set fileencodings=ucs-bom,utf-8,gbk,cp936,latin-1     "设置支持打开的文件的编码
    "解决菜单乱码
    source $VIMRUNTIME/delmenu.vim
    source $VIMRUNTIME/menu.vim

    "解决consle输出乱码
    language messages zh_CN.utf-8

" -----------------------------------------------------------------------------
"  < 显示隐藏菜单栏 >
" -----------------------------------------------------------------------------
" 显示/隐藏菜单栏、工具栏、滚动条，可用 Ctrl + F11 切换
    set guioptions-=m
    set guioptions-=T
    set guioptions-=r
    set guioptions-=L
    map <silent> <c-F11> :if &guioptions =~# 'm' <Bar>
                \set guioptions-=m <Bar>
                \set guioptions-=T <Bar>
                \set guioptions-=r <Bar>
                \set guioptions-=L <Bar>
                \else <Bar>
                \set guioptions+=m <Bar>
                \set guioptions+=T <Bar>
                \set guioptions+=r <Bar>
                \set guioptions+=L <Bar>
                \endif<CR>

" -----------------------------------------------------------------------------
"  < 编写文件时的配置 >
" -----------------------------------------------------------------------------
    filetype on                                           "启用文件类型侦测
    filetype plugin on                                    "针对不同的文件类型加载对应的插件
    filetype plugin indent on                             "启用缩进
    set smartindent                                       "启用智能对齐方式
    set expandtab                                         "将Tab键转换为空格
    set tabstop=4                                         "设置Tab键的宽度
    set shiftwidth=4                                      "换行时自动缩进4个空格
    set smarttab                                          "指定按一次backspace就删除shiftwidth宽度的空格
    set foldenable                                        "启用折叠
    set foldmethod=indent                                 "indent 折叠方式

    " 用空格键来开关折叠
    nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>
    "搜索模式里忽略大小写
    set ignorecase          
    "如果搜索模式包含大写字符，不使用 'ignorecase' 选项，只有在输入搜索模式并且打开 'ignorecase' 选项时才会使用                              
    set smartcase                                         
    " set noincsearch    


" 启用每行超过80列的字符提示（字体变蓝并加下划线），不启用就注释掉
"au BufWinEnter * let w:m2=matchadd('Underlined', '\%>' . 80 . 'v.\+', -1)

"
" -----------------------------------------------------------------------------
"  < 界面配置 >
" -----------------------------------------------------------------------------
    set number                                            "显示行号
    set laststatus=2                                      "启用状态栏信息
    set cmdheight=1                                       "设置命令行的高度为2，默认为1
    set cursorline                                        "突出显示当前行
    set guifont=YaHei_Consolas_Hybrid:h14                 "设置字体:字号（字体名称空格用下划线代替）
    "set guifont=DejaVu_Sans_Mono:h14
    set nowrap                                            "设置不自动换行
    set shortmess=atI                                     "去掉欢迎界面
    "配色方案
    colorscheme cc
    ""solarized
    winpos 0 0                                     "指定窗口出现的位置，坐标原点在屏幕左上角
    set lines=38 columns=120                          "指定窗口大小，lines为高度，columns为宽度

" -----------------------------------------------------------------------------
"  < 其它配置 >
" -----------------------------------------------------------------------------
    " set vb t_vb=                                "关闭提示音
    set nobackup                                "设置无备份文件
    set noswapfile                              "设置无临时文件
    set writebackup                             "保存文件前建立备份，保存成功后删除该备份

" -----------------------------------------------------------------------------
" 括号自动补全
" -----------------------------------------------------------------------------
    inoremap ( ()<Esc>i
    inoremap [ []<Esc>i
    inoremap { {}<Esc>i
    "autocmd Syntax html,vim inoremap < <lt>><Esc>i| inoremap > <c-r>=ClosePair('>')<CR>
    inoremap ) <c-r>=ClosePair(')')<CR>
    inoremap ] <c-r>=ClosePair(']')<CR>
    "inoremap } <c-r>=CloseBracket()<CR>
    inoremap " <c-r>=QuoteDelim('"')<CR>
    inoremap ' <c-r>=QuoteDelim("'")<CR>
    
    function! ClosePair(char)
        if getline('.')[col('.') - 1] == a:char
            return "\<Right>"
        else
            return a:char
        endif
    endf
    
    function! CloseBracket()
        if match(getline(line('.') + 1), '\s*}') < 0
            return "\<CR>}"
        else
            return "\<Esc>j0f}a"
        endif
    endf
    
    function! QuoteDelim(char)
        let line = getline('.')
        let col = col('.')
        if line[col - 2] == "\\"
            "Inserting a quoted quotation mark into the string
            return a:char
        elseif line[col - 1] == a:char
            "Escaping out of the string
            return "\<Right>"
        else
            "Starting a string
            return a:char.a:char."\<Esc>i"
        endif
    endf


" -----------------------------------------------------------------------------
"  < neocomplcache 插件配置 >
" -----------------------------------------------------------------------------
    " 关键字补全、文件路径补全、tag补全等等，各种，非常好用，速度超快。
    let g:neocomplcache_enable_at_startup = 1     "vim 启动时启用插件
    let g:neocomplcache_enable_smart_case = 1 
    let g:AutoComplPop_NotEnableAtStartup = 1
    let g:NeoComplCache_EnableAtStartup = 1
    let g:NeoComplCache_SmartCase = 1
    let g:NeoComplCache_TagsAutoUpdate = 1
    let g:NeoComplCache_EnableInfo = 1
    let g:NeoComplCache_EnableCamelCaseCompletion = 1
    let g:NeoComplCache_MinSyntaxLength = 3
    let g:NeoComplCache_EnableSkipCompletion = 1
    let g:NeoComplCache_SkipInputTime = '0.5'
    let g:NeoComplCache_SnippetsDir = $VIMFILES.'/snippets'
    "let g:neocomplcache_disable_auto_complete = 1 "不自动弹出补全列表
    " 在弹出补全列表后用 <c-p> 或 <c-n> 进行上下选择效果比较好

" -----------------------------------------------------------------------------
" 使用vimwiki
" -----------------------------------------------------------------------------
    " vimwiki
    let g:vimwiki_list = [{'path': 'E:\cc-space\my-wiki\vimwiki\','path_html': 'E:\cc-space\my-wiki\wikihtml\', 'template_path': 'E:\cc-space\my-wiki\wiki_template\','template_default': 'default', 'template_ext': '.html'}]
    let g:vimwiki_camel_case = 0

" 个人喜欢utf-8，要换的话下面模板中编码也要改
    set encoding=utf-8
    nnoremap <silent> <F12> :VimwikiAll2HTML<CR>
    nnoremap <silent> <F11> :Vimwiki2HTML<CR>

" -----------------------------------------------------------------------------
"  < vim-powerline  插件配置 >
" -----------------------------------------------------------------------------
" 设置状态栏主题风格
let g:Powerline_colorscheme='solarized256'

" -----------------------------------------------------------------------------
"  快捷键配置
" -----------------------------------------------------------------------------
    let mapleader="`"
    
    " 设置快捷键将选中文本块复制至系统剪贴板
    vnoremap <Leader>y "+y
    " 设置快捷键将系统剪贴板内容粘贴至 vim
    nmap <Leader>p "+p
    " 设置快捷键，使用；n，直接跳转下一个标签页
    nmap <Leader>n :tabn<CR>
    nmap <Leader>b :tabp<CR>
    " 设置快捷键，切换窗体
    nmap <Leader><Leader> <C-w>w


" -----------------------------------------------------------------------------
"  < taglist 插件配置>
"  首先到http://ctags.sourceforge.net下载ctags.exe文件将其拷贝到vim74中
"  ctags.exe要与gvim.exe同目录
"  然后安装Bundle 'taglist.vim'插件
" -----------------------------------------------------------------------------
    " taglist
    let Tlist_Auto_Highlight_Tag = 1
    let Tlist_Auto_Open = 1
    let Tlist_Auto_Update = 1
    let Tlist_Close_On_Select = 0
    let Tlist_Compact_Format = 0
    let Tlist_Display_Prototype = 0
    let Tlist_Display_Tag_Scope = 1
    let Tlist_Enable_Fold_Column = 0
    let Tlist_Exit_OnlyWindow = 0
    let Tlist_File_Fold_Auto_Close = 0
    let Tlist_GainFocus_On_ToggleOpen = 1
    let Tlist_Hightlight_Tag_On_BufEnter = 1
    let Tlist_Inc_Winwidth = 0
    let Tlist_Max_Submenu_Items = 1
    let Tlist_Max_Tag_Length = 30
    let Tlist_Process_File_Always = 0
    let Tlist_Show_Menu = 0
    let Tlist_Sort_Type = "order"
    let Tlist_Use_Horiz_Window = 0
    let Tlist_Use_Right_Window = 1
    let Tlist_WinWidth = 20
    let tlist_php_settings = 'php;c:class;i:interfaces;d:constant;f:function'
    "不同时显示多个文件的tag，只显示当前文件的
    let Tlist_Show_One_File = 1            
    set tags+=E:\cc\vim\tags
    
    "map <C-J> :!D:\php\php5.6\php.exe -l %<CR>
    
    let javascript_enable_domhtmlcss=1          " 打开javascript对dom、html和css的支持

""******************************************************
""键盘映射
""分割窗口里打开vimc文件
    :nnoremap <leader>ev :tabnew $MYVIMRC<cr>
    ""立即重新读取vimc 文件的设置
    :nnoremap <leader>sv :source $MYVIMRC<cr>

" NERDTree 配置 {{{
" -----------------------------------------------------------------------------
"   <   NERD Tree  插件配置   >
" -----------------------------------------------------------------------------
    nnoremap <silent> <F2> :NERDTree<CR>
    let NERDChristmasTree=1
    let NERDTreeAutoCenter=1
    let NERDTreeMouseMode=2
    let NERDTreeShowBookmarks=1
    let NERDTreeShowFiles=1
    let NERDTreeShowHidden=0
    let NERDTreeShowLineNumbers=1
    let NERDTreeWinPos='left'
    let NERDTreeWinSize=26
    nnoremap f :NERDTreeToggle
    nmap <Leader>l :TlistOpen<CR>;
    " 在 vim 启动的时候默认开启 NERDTree（autocmd 可以缩写为 au）
    autocmd VimEnter * NERDTree
"}}}

" -----------------------------------------------------------------------------
"  < html下的快捷键>
" -----------------------------------------------------------------------------
"":autocmd FileType html,vue,aspx let g:did_html_menus = 0;
"":autocmd FileType html,vue,aspx let g:did_html_toolbar = 0;
    :autocmd FileType html,vue,aspx nnoremap <leader>doc i<!DOCTYPE html><Esc>o<html><Esc>o<head><Esc>o<title></title><Esc>o</head><Esc>o<body><Esc>o</body><Esc>o</html><Esc>kO
    :autocmd FileType html,vue,aspx nnoremap <leader>div a<div></div><Esc>hhhhhi
    :autocmd FileType html,vue,aspx nnoremap <leader>a a<a href="javascript:;"></a><Esc>hhhi
    :autocmd FileType html,vue,aspx nnoremap <leader>span a<span></span><Esc>hhhhhhi
    :autocmd FileType html,vue,aspx nnoremap <leader>text a<input type="text" />
    :autocmd FileType html,vue,aspx nnoremap <leader>btn a<input type="button" value="" /><Esc>hhhi
    :autocmd FileType html,vue,aspx nnoremap <leader>func a<Space>:<Space>function(){<Esc>o},<Esc>O
    :autocmd FileType html,vue,aspx nnoremap <leader>style a<style type="text/css"><Esc>o</style><Esc>O
    :autocmd FileType html,vue,aspx nnoremap <leader>script a<script><Esc>o</script><Esc>O
    :autocmd FileType vue nnoremap <leader>vue a<script><Esc>oexport default {<Esc>odata : function(){<Esc>o},<Esc>oready : function(){<Esc>o},<Esc>omethods : {<Esc>o},<Esc>o}<Esc>o</script><Esc>kkk
"inoremap <? <?PHP<CR>?><Esc>O
"autocmd Syntax html,vim inoremap < <lt>><Esc>i| inoremap > <c-r>=ClosePair('>')<CR>
" -----------------------------------------------------------------------------
"  < jsbeautify的快捷键 >
" -----------------------------------------------------------------------------
".vimrc
map <c-f> :call JsBeautify()<cr>
" or
autocmd FileType javascript noremap <buffer>  <c-f> :call JsBeautify()<cr>
" for json
autocmd FileType json noremap <buffer> <c-f> :call JsonBeautify()<cr>
" for jsx
autocmd FileType jsx noremap <buffer> <c-f> :call JsxBeautify()<cr>
" for html
autocmd FileType html noremap <buffer> <c-f> :call HtmlBeautify()<cr>
autocmd FileType vue noremap <buffer> <c-f> :call HtmlBeautify()<cr>
" for css or scss
autocmd FileType css noremap <buffer> <c-f> :call CSSBeautify()<cr>
" -----------------------------------------------------------------------------
"  < 插入模式下的快捷键 >
" -----------------------------------------------------------------------------
    "" Ctrl + K 插入模式下光标向上移动
    "imap <c-k> <Up>
    "" Ctrl + J 插入模式下光标向下移动
    "imap <c-j> <Down>
    "" Ctrl + H 插入模式下光标向左移动
    "imap <c-h> <Left>
    "" Ctrl + L 插入模式下光标向右移动
    "imap <c-l> <Right>                                   "在输入要搜索的文字时，取消实时匹配
