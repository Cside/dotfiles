set runtimepath+=$HOME/.vim/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state($HOME.'/.vim/dein')
  call dein#begin($HOME.'/.vim/dein')

  " Let dein manage dein
  " Required:
  call dein#add($HOME.'/.vim/dein/repos/github.com/Shougo/dein.vim')

  " Add or remove your plugins here:
  call dein#add('vim-scripts/fish.vim')
  call dein#add('Cside/molokai')
  call dein#add('thinca/vim-quickrun')
  call dein#add('vim-syntastic/syntastic')
  call dein#add('maksimr/vim-jsbeautify')
  " call dein#add('powerline/powerline', {'rtp': 'powerline/bindings/vim'})
  " call dein#add('mattn/benchvimrc-vim') " 必要なときに使う

  " Required:
  call dein#end()
  call dein#save_state()
endif

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

" ==========================================
" Basic Settings
" ==========================================

syntax on
filetype plugin indent on
colorscheme molokai

set encoding=utf-8
set fileformat=unix
set fileencoding=utf-8

set expandtab
set tabstop=4
set shiftwidth=4
set noswapfile
set nobackup
set hlsearch

imap {} {}<Left>
imap [] []<Left>
imap () ()<Left>
imap "" ""<Left>
imap '' ''<Left>
imap <> <><Left>

" neadless
xmap u y

" Esc Esc でハイライト解除
nnoremap <ESC><ESC> :nohl<CR>

" file types
autocmd BufRead,BufNewFile *.fish set filetype=fish
autocmd BufNewFile,BufRead *.json set filetype=json

command! E :echo expand("%:p")

" window
nnoremap + <C-W>+
nnoremap - <C-W>-
nnoremap ) <C-W>>
nnoremap ( <C-W><LT>

nnoremap <C-l> :tabnext<CR>
nnoremap <C-h> :tabprev<CR>

" 保存時に beautify
autocmd BufWritePre *.js call JsBeautify()
autocmd BufWritePre *.jon call JsonBeautify()
autocmd BufWritePre *.html call HtmlBeautify()
autocmd BufWritePre *.css call CSSBeautify()


" shebang のあるファイルを保存時に自動で実行権限
autocmd BufWritePost * :call AddExecmod()
function AddExecmod()
    let line = getline(1)
    if strpart(line, 0, 2) == "#!"
        call system("chmod +x ". expand("%"))
    endif
endfunction

" 全角スペースと行末空白をハイライト
highlight ZenkakuSpace ctermbg=darkgrey
match ZenkakuSpace /\s\+$\|　/

" ==========================================
" Plugins
" ==========================================

" quickrun
nmap <Leader>r <plug>(quickrun)

" syntastic
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 1
let g:syntastic_enable_perl_checker = 1
let g:syntastic_perl_checkers = ['perl']

" powerline
" set statusline=2
