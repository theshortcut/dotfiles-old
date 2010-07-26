" load pathogen for vimbundle support
" eases updates and stuff
runtime! autoload/pathogen.vim
if exists('g:loaded_pathogen')
  call pathogen#runtime_prepend_subdirectories(expand('~/.vimbundles'))
end

set nocompatible
set backspace=indent,eol,start
set nobackup
set history=50
set ruler
set fdm=indent
set showcmd
set incsearch
set mouse=a
set number
set background=dark
set softtabstop=2
set tabstop=2
set shiftwidth=2
set expandtab
set vb t_vb=

if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

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
    au BufWriteCmd *.html,*.css,*.sass,*.scss,*.js :call Refresh_firefox()
    function! Refresh_firefox()
      if &modified
      write
      silent !echo  'vimYo = content.window.pageYOffset;
                   \ vimXo = content.window.pageXOffset;
                   \ BrowserReload();
                   \ content.window.scrollTo(vimXo,vimYo);
                   \ repl.quit();'  |
                   \ nc localhost 4242 2>&1 > /dev/null
      endif
    endfunction
  augroup END
else
  set autoindent
endif
