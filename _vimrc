"my configs
"
"ninja mode on
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
vnoremap <up> <nop>
vnoremap <down> <nop>
vnoremap <left> <nop>
vnoremap <right> <nop>
set encoding=utf-8
set wrap



"VUNDLE OPTIONS
set nocompatible               " be iMproved
filetype off                   " required!

" Setting up Vundle - the vim plugin bundler
let iVundleInstalled=1
let vundle_readme=expand('~/.vim/bundle/vundle/README.md')
if !filereadable(vundle_readme)
    echo "Installing Vundle.."
    echo ""
    silent !mkdir -p ~/.vim/bundle
    silent !git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
    let iVundleInstalled=0
endif


set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'a.vim'
Bundle 'gmarik/vundle'
Bundle 'Mark'
Bundle 'The-NERD-tree'
Bundle 'The-NERD-Commenter'
Bundle 'mru.vim'
"Bundle 'Auto-Pairs'
Bundle 'surround.vim'
Bundle 'Indent-Guides'
Bundle 'camelcasemotion'
Bundle 'argtextobj.vim'
Bundle 'vim-indent-object'
Bundle 'JSON.vim'
Bundle 'Tagbar'
Bundle 'EasyMotion'
"Bundle 'davidhalter/jedi-vim'
Bundle 'closetag.vim'
Bundle 'octol/vim-cpp-enhanced-highlight'
"Bundle 'Valloric/YouCompleteMe'
Bundle "dsolstad/vim-wombat256i"
Bundle "klen/python-mode"
Bundle "vim-airline/vim-airline"
Bundle "terryma/vim-multiple-cursors"

if iVundleInstalled == 0
    echo "Installing Bundles, please ignore key map error messages"
    echo ""
    :BundleInstall
endif
" Setting up Vundle - the vim plugin bundler end

filetype plugin indent on     " required!
"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..
"VUNDLE END

set shellpipe=2>&1\ \|\ tee " Output for :make (????)
set number " Включает отображение номеров строк
set nowrap " Отключить перенос строк

set undofile "файлы с историей действий (для отмены)
set undodir=~/.vim/vimundo

set noswapfile
set dir=~/.vim/vimswap "каталог для сохранения своп-файлов

set nobackup
set backupdir=~/.vim/vimbkp

set autochdir "текущий каталог всегда совпадает с содержимым активного окна

" Разрешить переключение буфера без сохранения
set hidden

set makeprg=ymakevim

set wcm=<Tab> "completion

set noignorecase
"set lazyredraw "отключить визуализацию при выполнении макросов
set list " Включить подсветку невидимых символов
set listchars=tab:»»,trail:⋅,nbsp:⋅ " Настройка подсветки невидимых символов
set fileencodings=utf-8,cp1251,koi8-r,cp866 " Список кодировок файлов для автоопределения
set keymap=russian-jcukenwin " Настраиваем переключение раскладок клавиатуры по <C-^>
set iminsert=0 " Раскладка по умолчанию - английская
set imsearch=0
set switchbuf=useopen,split "usetab,newtab "открывать новый буфер в новой вкладке
let mapleader = "\\" "биндим <Leader> клавишу
set synmaxcol=128

" Pylint
let g:pymode_options_max_line_length = 120
autocmd FileType python set colorcolumn=120
let g:pymode_lint_ignore="E501,E261,E262,E265,C901,E402"
let g:pymode_folding = 0
let g:pymode_rope_completion = 0

let g:alternateNoDefaultAlternate=1

"set showtabline=2 "Всегда видим вкладки
"" Go to .proto on gf instead of .pb.h
"" make repo path work too
function GetIncludePath()
    let repo = $REPO_NAME
    let ret = fnamemodify(expand("%"), ":p:h:s?" . repo . "/.*$?" . repo . "?")
    let ret .= "/" . substitute(v:fname, '\.pb\.h$', '.proto', '')
    return ret
endfunction

set includeexpr=GetIncludePath()

"Indent and tabulation
set tabstop=4 " количество пробелов, которыми символ табуляции отображается в тексте
set shiftwidth=4 "количество пробелов, которыми символ табуляции отображается при добавлении
set expandtab "в режиме вставки заменяет символ табуляции на соответствующее количество пробелов. Так же влияет на отступы, добавляемые командами >> и <<
set smartindent " делает то же, что и autoindent плюс автоматически выставляет отступы в «нужных» местах. В частности, отступ ставится после строки, которая заканчивается символом {

set autoread " Set to auto read when a file is changed from the outside
set wildmenu "Turn on WiLd menu
set ruler "Always show current position

" К примеру, если вы наберете 2d, то в правом нижнем углу экрана Vim отобразит строку 2d.
set showcmd
" Включаем отображение дополнительной информации в статусной строке
set statusline=%<%F%h%m%r%=type=%y\ format=%{&fileformat}\ file=%{&fileencoding}\ enc=%{&encoding}\ %b\ 0x%B\ %l,%c%V\ %P
set laststatus=2 "Значение 2 указывает, что строка статуса всегда должна показываться;

"конфигурация NerdTree
let NERDTreeQuitOnOpen=1
let NERDCommentWholeLinesInVMode=0

"конфигурация indent_guides
let g:indent_guides_guide_size = 1
let g:indent_guides_start_level = 2

"конфигурация tagbar
let g:tagbar_autoclose = 1
let g:tagbar_autofocus = 1

"конфигурация closetag
let g:closetag_html_style=1
source ~/.vim/bundle/closetag.vim/plugin/closetag.vim

let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg='gray'
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg='lightgray'

"let g:jedi#auto_vim_configuration=0
"let g:jedi#popup_select_first=0
let g:jedi#show_call_signatures="2"

"конфигурация YouComleteMe
let g:ycm_global_ycm_extra_conf ='/home/diver/py/.ycm_extra_conf.py'

if has('python')
    python import os.path
    let g:ycm_extra_conf_globlist = [
        \ pyeval('os.path.realpath(os.path.expandvars("$HOME/py/.ycm_extra_conf.py"))'),
        \ pyeval('"!" + os.path.realpath(os.path.expandvars("$HOME/*"))'),
    \ ]
endif
"let g:ycm_enable_diagnostic_signs=1
"let g:ycm_enable_diagnostic_highlighting=0
"save old behavior
nmap <cr> :YcmCompleter GoToDefinitionElseDeclaration<CR>
nmap <c-w><cr> :sp<cr>:YcmCompleter GoToDefinitionElseDeclaration<CR>

" automatically open and close the popup menu / preview window
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
set completeopt=menuone,menu,longest

" add json filetype
au! BufRead,BufNewFile *.json set filetype=json

"Preview window on the bottom of vim
"function! PreviewDown()
"    if !&previewwindow
"        silent! wincmd P
"    endif
"    if &previewwindow
"        silent! wincmd J
"        silent! wincmd p
"    endif
"endf
"au BufWinEnter * call PreviewDown()

" Configure syntax specific options
syntax on " syntax hilight on
"syntax sync fromstart
filetype indent on
filetype plugin on

"prog langs configs
setlocal keywordprg=pydoc "Установка быстрой помощи по K для слова под курсором с помощью pydoc

"Tab autocompletion
function InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-n>"
    endif
endfunction

let python_highlight_all = 1

" MAPPINGS
" Очистить подсветку последнего найденного выражения
nmap <F2> :NERDTreeToggle<CR>
nmap <F3> :TagbarToggle<CR>
"nmap <F6> :!~/bin/ctags -R --c++-kinds=+pl --fields=+iaS --extra=+q ./<CR>
"nmap <F12> :nohlsearch<CR>
nmap <F5> :SyntasticCheck<CR><C-L>

"COLORS
set t_Co=256
colorscheme wombat256i
set cursorline


function ShortTabLine()
    let ret = ''
    for i in range(tabpagenr('$'))
        " Если мы имеем дело с активной вкладкой — подсвечиваем ее красной
        if i + 1 == tabpagenr()
            let ret .= '%#errorMsg#'
        else
            let ret .= '%#TabLine#'
        endif
        " ищем название буфера, чтобы поместить его в название вкладки
        let buflist = tabpagebuflist(i + 1)
        let winnr = tabpagewinnr(i + 1)
        let buffername = bufname(buflist[winnr - 1])
        let filename = fnamemodify(buffername, ':t')
        " Если нет названия — то так и говорим 'буфер без названия' (noname)
        if filename == ''
            let filename = 'noname'
        endif

        " Если название слишком длинное — показываем только 6 первых символов
        "if strlen(filename) >= 8
        "    let ret .= '[' . filename[0:5] . '..]'
        "else
            let ret .= '[' . filename . ']'
        "endif
    endfor

    " заполняем лишнее пространство
    let ret .= '%#TabLineFill#%T'
    return ret
endfunction


" устанавливаем нашу функцию в качестве обработчика строки вкладок
set tabline=%!ShortTabLine()


" allow backspacing over everything in insert mode
set backspace=indent,eol,start

set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching
set hlsearch

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

"In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")
    " vim -b : edit binary using xxd-format!
    augroup Binary
      au!
      au BufReadPre  *.bin let &bin=1
      au BufReadPost *.bin if &bin | %!xxd
      au BufReadPost *.bin set ft=xxd | endif
      au BufWritePre *.bin if &bin | %!xxd -r
      au BufWritePre *.bin endif
      au BufWritePost *.bin if &bin | %!xxd
      au BufWritePost *.bin set nomod | endif
    augroup END

    " Enable file type detection.
    " Use the default filetype settings, so that mail gets 'tw' set to 72,
    " 'cindent' is on in C files, etc.
    " Also load indent files, to automatically do language-dependent indenting.
    filetype plugin indent on

    " Put these in an autocmd group, so that we can delete them easily.
    augroup vimrcEx
    au!

    " For all text files set 'textwidth' to 78 characters.
    "autocmd FileType text setlocal textwidth=78

    " When editing a file, always jump to the last known cursor position.
    " Don't do it when the position is invalid or when inside an event handler
    " (happens when dropping a file on gvim).
    " Also don't do it when the mark is in the first line, that is the default
    " position when opening a file.
    autocmd BufReadPost *
      \ if line("'\"") > 1 && line("'\"") <= line("$") |
      \   exe "normal! g`\"" |
      \ endif

    augroup END

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

