" load pathogen for vimbundle support
" eases updates and stuff
runtime! autoload/pathogen.vim
if exists('g:loaded_pathogen')
  call pathogen#surround('/Users/clay/.vimbundles/{}')
end

set nocompatible
set backspace=indent,eol,start
set nobackup
set nowritebackup
set noswapfile
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
set laststatus=2
set clipboard+=unnamed
set expandtab " spaces ftw
set vb t_vb= " disable visual bell
set list! " show invisibles
set listchars=tab:▸\ ,trail:·,eol:¬ " textmate style invisible chars
colorscheme solarized

if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

if has("autocmd")
  filetype plugin indent on
  filetype plugin on
  " auto change working dir
  autocmd BufEnter * lcd %:p:h
  augroup vimrcEx
    au!
    au FileType text setlocal textwidth=78
    au BufNewFile,BufRead *.hm set filetype=javascript
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

" STATUSBAR

hi StatColor guibg=#95e454 guifg=black ctermbg=lightgreen ctermfg=black
hi Modified guibg=orange guifg=black ctermbg=lightred ctermfg=black
hi PatchColor ctermfg=255 ctermbg=161 guifg=black guibg=#FF0066

function! MyStatusLine(mode)
    let statusline=""

    if a:mode == 'Enter'
        let statusline.="%#StatColor#"
    endif
    let statusline.="\(%n\)\ %f\ "
    if a:mode == 'Enter'
        let statusline.="%*"
    endif
    let statusline.="%#Modified#%m"
    if a:mode == 'Leave'
        let statusline.="%*%r"
    elseif a:mode == 'Enter'
        let statusline.="%r%*"
    endif
    let statusline .= "\ (%l/%L,\ %c)\ %P%=%h%w\ %y\ [%{&encoding}:%{&fileformat}]\ \ "
    return statusline
endfunction

au WinEnter * setlocal statusline=%!MyStatusLine('Enter')
au WinLeave * setlocal statusline=%!MyStatusLine('Leave')
set statusline=%!MyStatusLine('Enter')

function! InsertStatuslineColor(mode)
  if a:mode == 'i'
    hi StatColor guibg=orange ctermbg=lightred
  elseif a:mode == 'r'
    hi StatColor guibg=#e454ba ctermbg=magenta
  elseif a:mode == 'v'
    hi StatColor guibg=#e454ba ctermbg=magenta
  else
    hi StatColor guibg=red ctermbg=red
  endif
endfunction

" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" Fuzzy Finder
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](node_modules|vendors|build|\.git)$',
  \ }

" Syntastic
let g:syntastic_enable_balloons=1
let g:syntastic_check_on_open=1
let g:syntastic_javascript_jshint_conf="~/.jshintrc"
let g:syntastic_javascript_syntax_checker="jshint"

" UltiSnips
function! g:UltiSnips_Complete()
  call UltiSnips#ExpandSnippet()
  if g:ulti_expand_res == 0
    if pumvisible()
      return "\<C-n>"
    else
      call UltiSnips_JumpForwards()
      if g:ulti_jump_forwards_res == 0
        return "\<TAB>"
      endif
    endif
  endif
  return ""
endfunction

au BufEnter * exec "inoremap <silent> " . g:UltiSnipsExpandTrigger . " <C-R>=g:UltiSnips_Complete()<cr>"
let g:UltiSnipsExpandTrigger="<c-l>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsListSnippets="<c-h>"

function! g:JInYCM()
  if pumvisible()
    return "\<C-n>"
  else
    return "\<c-j>"
  endif
endfunction

function! g:KInYCM()
  if pumvisible()
    return "\<C-p>"
  else
    return "\<c-k>"
  endif
endfunction

inoremap <c-j> <c-r>=g:JInYCM()<cr>
au BufEnter,BufRead * exec "inoremap <silent> " . g:UltiSnipsJumpBackwardTrigger . " <C-R>=g:KInYCM()<cr>"
let g:UltiSnipsJumpBackwardTrigger = "<c-k>"

" Powerline
set rtp+=~/.powerline/powerline/bindings/vim
let g:Powerline_symbols = 'fancy'

" No netrwhist files
let g:netrw_dirhistmax = 0

au InsertEnter * call InsertStatuslineColor(v:insertmode)
au InsertLeave * hi StatColor guibg=#95e454 guifg=black ctermbg=lightgreen ctermfg=black

"" FocusMode
function! ToggleFocusMode()
  if (&foldcolumn != 12)
    set laststatus=0
    set numberwidth=10
    set foldcolumn=12
    set noruler
    hi FoldColumn ctermbg=none
    hi LineNr ctermfg=0 ctermbg=none
    hi NonText ctermfg=0
  else
    set laststatus=2
    set numberwidth=4
    set foldcolumn=0
    set ruler
    colorscheme solarized "re-call your colorscheme
  endif
endfunc
nnoremap <F1> :call ToggleFocusMode()<cr>
