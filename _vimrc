set nocompatible
"source $VIMRUNTIME/vimrc_example.vim
"source $VIMRUNTIME/mswin.vim
"behave mswin

set guifont=Consolas:h12:cRUSSIAN
colorscheme far
syntax on
set number

set backspace=indent,eol,start whichwrap+=<,>,[,]

set autoindent
set shiftwidth=4
set tabstop=4
set softtabstop=4
set smarttab

set novisualbell
set t_vb=

set nobackup
set nowritebackup
set noswapfile


set iskeyword=@,a-z,A-Z,48-57,_,128-175,192-255
set hls is

set diffexpr=MyDiff()
function MyDiff()
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

"set encoding=utf-8
"set termencoding=utf-8

set fileencodings=utf-8,cp1251,cp866,koi8-r

" <F7> File fileformat (dos - <CR> <NL>, unix - <NL>, mac - <CR>)
map <F7>	:execute RotateFileFormat()<CR>
vmap <F7>	<C-C><F7>
imap <F7>	<C-O><F7>
let b:fformatindex=0
function! RotateFileFormat()
  let y = -1
  while y == -1
    let encstring = "#unix#dos#mac#"
    let x = match(encstring,"#",b:fformatindex)
    let y = match(encstring,"#",x+1)
    let b:fformatindex = x+1
    if y == -1
      let b:fformatindex = 0
    else
      let str = strpart(encstring,x+1,y-x-1)
      return ":set fileformat=".str
    endif
  endwhile
endfunction

" <F8> File encoding for open
" ucs-2le - MS Windows unicode encoding
map <F8>	:execute RotateEnc()<CR>
vmap <F8>	<C-C><F8>
imap <F8>	<C-O><F8>
let b:encindex=0
function! RotateEnc()
  let y = -1
  while y == -1
    let encstring = "#koi8-r#cp1251#8bit-cp866#utf-8#ucs-2le#"
    let x = match(encstring,"#",b:encindex)
    let y = match(encstring,"#",x+1)
    let b:encindex = x+1
    if y == -1
      let b:encindex = 0
    else
      let str = strpart(encstring,x+1,y-x-1)
      return ":e ++enc=".str
    endif
  endwhile
endfunction

" <Shift+F8> Force file encoding for open (encoding = fileencoding)
map <S-F8>	:execute ForceRotateEnc()<CR>
vmap <S-F8>	<C-C><S-F8>
imap <S-F8>	<C-O><S-F8>
let b:encindex=0
function! ForceRotateEnc()
  let y = -1
  while y == -1
    let encstring = "#koi8-r#cp1251#8bit-cp866#utf-8#ucs-2le#"
    let x = match(encstring,"#",b:encindex)
    let y = match(encstring,"#",x+1)
    let b:encindex = x+1
    if y == -1
      let b:encindex = 0
    else
      let str = strpart(encstring,x+1,y-x-1)
      :execute "set encoding=".str
      return ":e ++enc=".str
    endif
  endwhile
endfunction

" <Ctrl+F8> File encoding for save (convert)
map <C-F8>	:execute RotateFEnc()<CR>
vmap <C-F8>	<C-C><C-F8>
imap <C-F8>	<C-O><C-F8>
let b:fencindex=0
function! RotateFEnc()
  let y = -1
  while y == -1
    let encstring = "#koi8-r#cp1251#8bit-cp866#utf-8#ucs-2le#"
    let x = match(encstring,"#",b:fencindex)
    let y = match(encstring,"#",x+1)
    let b:fencindex = x+1
    if y == -1
      let b:fencindex = 0
    else
      let str = strpart(encstring,x+1,y-x-1)
      return ":set fenc=".str
    endif
  endwhile
endfunction

set statusline=%<%f%h%m%r%=format=%{&fileformat}\ file=%{&fileencoding}\ enc=%{&encoding}\ %b\ 0x%B\ %l,%c%V\ %P
set laststatus=2
set t_Co=256

map � `
map � q
map � w
map � e
map � r
map � t
map � y
map � u
map � i
map � o
map � p
map � [
map � ]
map � a
map � s
map � d
map � f
map � g
map � h
map � j
map � k
map � l
map � ;
map � '
map � z
map � x
map � c
map � v
map � b
map � n
map � m
map � ,
map � .
map . /

map � ~
map � Q
map � W
map � E
map � R
map � T
map � Y
map � U
map � I
map � O
map � P
map � {
map � }
map � A
map � S
map � D
map � F
map � G
map � H
map � J
map � K
map � L
map � :
map � "
map � Z
map � X
map � C
map � V
map � B
map � N
map � M
map � <
map � >
map , ?

