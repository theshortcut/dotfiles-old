map <S-Insert> <MiddleMouse>
map! <S-Insert> <MiddleMouse>

set list
set lines=65
set columns=150
set guioptions=egmrLt
set enc=utf-8
set gfn=Inconsolata:h15

colorscheme solarized

:nmap  :set invnumber
 
if has("gui_macvim")
  set transparency=8
endif
