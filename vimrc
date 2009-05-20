set nocompatible
set backspace=indent,eol,start
set nobackup
set history=50
set ruler
set showcmd
set incsearch
set mouse=a

if has("autocmd")
  filetype plugin indent on
  filetype plugin on
  augroup vimrcEx
  au!
  au FileType text setlocal textwidth=78
  au BufNewFile,BufRead *.mxml set filetype=mxml
  au BufNewFile,BufRead *.as set filetype=actionscript
  au BufNewFile,BufRead *.mxml compiler flex
  au BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif
  augroup END
else
  set autoindent
endif
