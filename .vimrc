set runtimepath+=$HOME/.vim/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state($HOME.'/.vim/dein')
  call dein#begin($HOME.'/.vim/dein')

  " Let dein manage dein
  " Required:
  call dein#add($HOME.'/.vim/dein/repos/github.com/Shougo/dein.vim')

  " Add or remove your plugins here:
  call dein#add('vim-scripts/fish.vim')
  call dein#add('thinca/vim-quickrun')
  call dein#add('Shougo/unite.vim')
  call dein#add('Shougo/neomru.vim')
  call dein#add('k0kubun/unite-git-files')
  call dein#add('tpope/vim-fugitive')
  call dein#add('leafgarland/typescript-vim')

  call dein#add('Cside/vim-monokai')

  call dein#add('plasticboy/vim-markdown')
  call dein#add('chr4/nginx.vim')
  call dein#add('sgur/vim-editorconfig')
  call dein#add('Cside/vim-pixela')
  call dein#add('ekalinin/Dockerfile.vim')

  " call dein#add('godlygeek/tabular')
  " call dein#add('vim-syntastic/syntastic')
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
colorscheme monokai

set encoding=utf-8
set fileformat=unix
set fileencoding=utf-8

set expandtab
set nowrap
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
autocmd BufRead,BufNewFile *.tt      set filetype=html
autocmd BufRead,BufNewFile *.fish    set filetype=fish
autocmd BufNewFile,BufRead *.json    set filetype=json
autocmd BufNewFile,BufRead *.ts      set filetype=typescript
autocmd BufNewFile,BufRead *.atom    set filetype=xml
autocmd BufNewFile,BufRead *.Capfile set filetype=ruby

command! E :echo expand("%")

" window
nnoremap + <C-W>+
nnoremap - <C-W>-
nnoremap ) <C-W>>
nnoremap ( <C-W><LT>

nnoremap <C-l> :tabnext<CR>
nnoremap <C-h> :tabprev<CR>

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

" status line
set stl=%f
set stl+=\ %m
set stl+=%=
set stl+=\ %l
set stl+=\ %c
set laststatus=2

" 自動 mkdir
augroup vimrc-auto-mkdir  " {{{
  autocmd!
  autocmd BufWritePre * call s:auto_mkdir(expand('<afile>:p:h'))
  function! s:auto_mkdir(dir)  " {{{
    if !isdirectory(a:dir)
      call mkdir(iconv(a:dir, &encoding, &termencoding), 'p')
    endif
  endfunction  " }}}
augroup END  " }}}

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

let g:vim_markdown_folding_disabled = 1

" unite
let g:unite_enable_start_insert = 1
let g:unite_source_file_mru_time_format = ""

" pixela
let g:pixela_username = 'cside'
let g:pixela_token = 'csidestory'
let g:pixela_debug = 0

" nnoremap <silent> <Space>ur :Unite -buffer-name=files file_rec file/new<CR>
nnoremap <silent> <Space>ur :Unite git_files<CR>
nnoremap <silent> <Space>uf :Unite -buffer-name=file file_mru file/new<CR>
" Unite バッファで <Esc>x2 で終了
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>
