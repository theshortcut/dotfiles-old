map <S-Insert> <MiddleMouse>
map! <S-Insert> <MiddleMouse>
syntax on
set hlsearch
set background=dark
set number
set softtabstop=2
set tabstop=4
set shiftwidth=2
set expandtab
set autoindent
colorscheme ir_black
set list
set lines=65
set columns=150
set guioptions=egmrLTt
set enc=utf-8
hi LineNr guifg=#333333
:nmap  :set invnumber
set go-=T
set gfn=Clean

if has("gui_macvim")
  set transparency=8
endif

if has("gui_gtk2")
  set go+=T
endif
