" An example for a gvimrc file.
" The commands in this are executed when the GUI is started.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2001 Sep 02
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.gvimrc
"	      for Amiga:  s:.gvimrc
"  for MS-DOS and Win32:  $VIM\_gvimrc
"	    for OpenVMS:  sys$login:.gvimrc

" Make external commands work through a pipe instead of a pseudo-tty
"set noguipty

" set the X11 font to use
" set guifont=Inconsolata:h14

set ch=2		" Make command line two lines high

set mousehide		" Hide the mouse when typing text

" Make shift-insert work like in Xterm
map <S-Insert> <MiddleMouse>
map! <S-Insert> <MiddleMouse>

" Only do this for Vim version 5.0 and later.
if version >= 500

  " I like highlighting strings inside C comments
  let c_comment_strings=1

  " Switch on syntax highlighting if it wasn't on yet.
  if !exists("syntax_on")
    syntax on
  endif

  " Switch on search pattern highlighting.
  set hlsearch

  set background=dark
  set number
  set softtabstop=2
  set tabstop=4
  set shiftwidth=2
  set expandtab
  set autoindent
  

  " For Win32 version, have "K" lookup the keyword in a help file
  "if has("win32")
  "  let winhelpfile='windows.hlp'
  "  map K :execute "!start winhlp32 -k <cword> " . winhelpfile <CR>
  "endif

  " Set nice colors
  " background for normal text is light grey
  " Text below the last line is darker grey
  " Cursor is green, Cyan when ":lmap" mappings are active
  " Constants are not underlined but have a slightly lighter background
  " highlight Normal guibg=grey90
  " highlight Cursor guibg=Green guifg=NONE
  " highlight lCursor guibg=Cyan guifg=NONE
  " highlight NonText guibg=grey80
  " highlight Constant gui=NONE guibg=grey95
  " highlight Special gui=NONE guibg=grey95
  set gfn=Inconsolata:h14
  set guifont="Inconsolata"
  colorscheme ir_black
  set list
  set lines=65
  set columns=150
  set guioptions=egrLt
  set enc=utf-8
  hi LineNr guifg=#333333
  :nmap  :set invnumber
  set go-=mT
  set transparency=8
endif
