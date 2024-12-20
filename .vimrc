call plug#begin('~/.vim/plugged')		" Begin Vim-Plug plugin manager configuration
	" nerdtree
	Plug 'scrooloose/nerdtree'
	" tagbar for C
	Plug 'majutsushi/tagbar'
	" vim-airline
	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'
	" NERDCommenter
	Plug 'scrooloose/nerdcommenter'
	" vim-illuminate
	Plug 'rrethy/vim-illuminate'
	" IndentLine
	Plug 'Yggdroot/indentLine'
	" vim-guofront
	Plug 'schmich/vim-guifont'
	" code complete
	Plug 'Valloric/YouCompleteMe'
	" highlight markdown
	Plug 'plasticboy/vim-markdown'
	" highlight C++
	Plug 'octol/vim-cpp-enhanced-highlight'
	" Syntastic 
	Plug 'scrooloose/syntastic'
	" wakaTime
	Plug 'wakatime/vim-wakatime'
call plug#end()			" End Vim-Plug plugin manager configuration 

syntax on               " Set syntax highlighting
set number              " Set the line number
set tabstop=4           " Set an indent to account for 4 spaces
set autoindent          " Set up automatic indentation
set mouse=r             " Set mouse is always available, set mouse= (empty) cancel
set cc=80               " Column 80 highlighted, set cc=0 cancellation
set cursorline          " Settings to highlight the current row
set cindent             " Format C language
set st=4                " Set the width of the soft tab to 4 spaces
set shiftwidth=4        " The width automatically indented when setting a new line is 4 spaces
set sts=4               " Set the number of spaces inserted when the Tab key is pressed in insertion mode to 4
set ruler               " Show the status of the last line
set showmode            " The status of this row is displayed in the lower left corner.
set bg=dark             " Show different background tones
set hlsearch            " Enable Search Highlight
set incsearch           " Enable Search Highlight also
set laststatus=2        " Always display the status bar
set list lcs=tab:\$\   		" Set to use a vertical bar "$" when displaying Tab characters
autocmd BufWritePost $MYVIMRC source $MYVIMRC " make it :source % after :w
set signcolumn=yes " open sidebar
let g:ycm_clangd_binary_path='clangd' " clangd complete code
set ignorecase " ignore case/CASE
set clipboard=unnamedplus  

" Set Automatically Complete Parentheses
inoremap ' ''<ESC>i
inoremap " ""<ESC>i
inoremap ( ()<ESC>i
inoremap [ []<ESC>i
inoremap < <><ESC>i
inoremap { {<CR>}<ESC>O

" Compile C language 
function! CompileRunC()
	let filetype = expand("%:e")
	exec 'w'
	if filetype == 'h'
		exec '!gcc -fsyntax-only %'
	else
		exec "!mkdir -p bin && gcc % -o bin/%< && ./bin/%<"
	endif
endfunction 

" Compile C++ language 
function! CompileRunGpp()
	exec "w"
	exec "!mkdir -p bin && g++ % -o bin/%< && ./bin/%<"
endfunction

" a function you can choose how to compile 
function! ChooseCompileMethod()
	echo "Unrecognized file type: " . expand('%:e')
	echo "Please choose a compile method:"
	echo "1. Compile as C"
	echo "2. Compile as C++"
	let choice = input("Enter your choice:")
	if choice == '1'
		call CompileRunC()
	elseif choice == '2'
		call CompileRunGpp()
	else 
		echo "Invalid choice. No action taken."
	endif
endfunction 

" Compile run function 
function! CompileRun()
	let filetype = expand('%:e')
	if filetype == 'c'
		call CompileRunC()
	elseif filetype == 'cpp'
		call CompileRunGpp()
	else 
		call ChooseCompileMethod()
	endif 
endfunction 

map <F5> :call CompileRun()<CR>

" Configure the NERDTree plugin mapping button
" Automatically open NERDTree after opening the file
autocmd VimEnter * NERDTree
" Key F2: Map other tabs
map <F2> :NERDTreeMirror<CR>
" Key F3: Expand/shrink NERDTree
map <F3> :NERDTreeToggle<CR>
" Key f: In the NERDTree window, jump the cursor to the currently open file.
map f :NERDTreeFind<CR>
" Key 1: Switch to the previous tab
map 1 :tabp<CR>
" Key 2: Switch to the next tab
map 2 :tabn<CR>

" Configure the Tagbar plugin mapping button
" Set the plug-in of ctags used by tagbar
let g:tagbar_ctags_bin='/usr/bin/ctags'
" Key F4: Shrink/Expand Tagbar Window
map <F4> :TagbarToggle<CR>
" Set the window width of tagbar to 35
let g:tagbar_width = 35
" Append the C/C++standard library header file to tags
set tags+=/usr/include/tags
" Open the tagbar automatically when opening the file
autocmd BufReadPost *.cpp,*.c,*.h,*.cc,*.cxx call tagbar#autoopen()

" Configure the vim-illuminate
hi illuminatedWord ctermfg=white ctermbg=99

" IndentLine
" Enable IndentLine plugin
let g:indentLine_enabled = 1
" Set the characters for the indentation line, with a default value of '|'
let g:indentLine_char = '¦'
" Make the plugin run properly
let g:indentLine_conceallevel = 2

" guifront++
"让vim像IDE一样一键放大缩小字号
let guifontpp_size_increment=1 "每次更改的字号
let guifontpp_smaller_font_map="<M-Down>" "放大
let guifontpp_larger_font_map="<M-Up>"      "缩小
let guifontpp_original_font_map="<M-Home>"  "默认大小

" YouCompleteMe
set runtimepath+=~/.vim/bundle/YouCompleteMe
let g:ycm_collect_identifiers_from_tags_files = 1           " 开启 YCM 基于标签引擎
let g:ycm_collect_identifiers_from_comments_and_strings = 1 " 注释与字符串中的内容也用于补全
let g:syntastic_ignore_files=[".*\.py$"]
let g:ycm_seed_identifiers_with_syntax = 1                  " 语法关键字补全
let g:ycm_complete_in_comments = 1
let g:ycm_confirm_extra_conf = 0
let g:ycm_key_list_select_completion = ['<c-n>', '<Down>']  " 映射按键, 没有这个会拦截掉tab, 导致其他插件的tab不能用.
let g:ycm_key_list_previous_completion = ['<c-p>', '<Up>']
let g:ycm_complete_in_comments = 1                          " 在注释输入中也能补全
let g:ycm_complete_in_strings = 1                           " 在字符串输入中也能补全
let g:ycm_collect_identifiers_from_comments_and_strings = 1 " 注释和字符串中的文字也会被收入补全
let g:ycm_global_ycm_extra_conf='~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_show_diagnostics_ui = 0                           " 禁用语法检查
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>" |            " 回车即选中当前项
nnoremap <c-j> :YcmCompleter GoToDefinitionElseDeclaration<CR>|     " 跳转到定义处
"let g:ycm_min_num_of_chars_for_completion=2                 " 从第2个键入字符就开始罗列匹配项
let g:ycm_global_ycm_extra_conf = "~/.vim/plugged/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py"

" vim-markdown
let g:vim_markdown_no_extensions_in_markdown = 1

"" vim-cpp-enhanced-highlight
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_experimental_template_highlight = 1

" 自定义error和warning图标
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚡'
" 显示Linter名称,出错或警告等相关信息
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]' 
"设置状态栏显示的内容,这里必须添加%{ALEGetStatusLine()到状态栏里
"设置ale显示内容
let g:ale_statusline_format = ['✗ %d', '⚡ %d', '✔ OK']
" 对verilog、c++、c、python单独设置linter
let g:ale_linters = { 'verilog': ['vlog'],
\   'c++': ['clangd'],
\   'c': ['gcc'],
\   'python': ['pylint'],
\}

let g:ale_lint_on_text_changed = 1
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1

" Syntastic 
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntasic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:synastic_check_on_open = 1
let g:synastic_check_on_wq = 0
let g:synastic_auto_jump = 1

" error and warning flags 
let g:synastic_enable_signs = 1
let g:syntastic_error_symbol = '?'
let g:synastic_warning_symbol = '?'

" vim-airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'unique_tail'

nnoremap J :bprevious <CR>
nnoremap K :bnext <CR>


