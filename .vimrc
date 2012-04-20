set nocompatible " This is vim, not vi 
filetype plugin indent on 

" ===========================
"   Vundle
" ==========================
set rtp+=~/.vim/vundle/
call vundle#rc('~/.vim/bundle')

Bundle 'Shougo/unite.vim'
Bundle 'h1mesuke/unite-outline'
Bundle 'tpope/vim-fugitive'
Bundle 'tyru/current-func-info.vim'
Bundle 'petdance/vim-perl'
Bundle 'hotchpotch/perldoc-vim'
Bundle 'kchmck/vim-coffee-script'
Bundle 'thinca/vim-ref'
Bundle 'vim-scripts/The-NERD-Commenter'
Bundle 'othree/eregex.vim'
Bundle 'pangloss/vim-javascript'
Bundle 'pekepeke/titanium-vim'
Bundle 'Shougo/neocomplcache'
Bundle 'thinca/vim-quickrun'
Bundle 'Shougo/neocomplcache-snippets-complete'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-speeddating'
Bundle 'mattn/zencoding-vim'
Bundle 'tsaleh/vim-align'
Bundle 'skammer/vim-css-color'
" Bundle 'cschlueter/vim-wombat'
" Bundle 'tyru/open-browser.vim'
" Bundle 'tpope/vim-haml'
" Bundle 'vim-ruby/vim-ruby'
" Bundle 'mattn/benchvimrc-vim'

" for alc
nnoremap <Leader>p <Esc>:Perldoc<Space>
noremap <expr><Leader>a ':Ref alc ' . expand('<cword>') . '<CR>'

"" eregex
"nnoremap / :M/
"nnoremap ? :M?
"nnoremap ,/ /
"nnoremap ,? ?

" ===========================
"   Plugins
" ==========================
" QuickRun
nmap <Leader>r <plug>(quickrun)
" open-browser.vim
nmap <Space>o <Plug>(openbrowser-smart-search)
" Surround.vim
let g:surround_{char2nr("*")} = "/* \r */"
let g:surround_{char2nr("$")} = "$=h:\r$"
let g:surround_{char2nr("-")} = "<!-- \r -->"
" Ref.vim

" Zen
let g:user_zen_settings = {
  \  'indentation' : '  ',
\}

nmap <silent> <buffer> em :PerlUseInsertionCWord<CR>

" ----------------------------------------------------------------
" neocomplcache
" ----------------------------------------------------------------

" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use underbar completion.
let g:neocomplcache_enable_underbar_completion = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

 " Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Use camel case completion.
let g:neocomplcache_enable_camel_case_completion = 1
" <TAB> で補完候補を選択
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

let g:neocomplcache_ctags_arguments_list = {
  \ 'perl' : '-R -h ".pm"'
  \ }

let g:neocomplcache_snippets_dir = "~/.vim/snippets"
" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default'    : '',
    \ 'perl'       : $HOME . '/.vim/dict/perl.dict',
    \ 'javascript' : $HOME . '/.vim/dict/javascript.dict',
    \ 'html'       : $HOME . '/.vim/dict/javascript.dict',
    \ 'scala'      : $HOME . '/.vim/dict/scala.dict'
    \ }

" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
  let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" for snippets
imap <expr><C-k>    neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : "\<C-n>"
smap       <C-k> <Plug>(neocomplcache_snippets_expand)


" -------------------------------------------------------------------------
"  unite.vim
" -------------------------------------------------------------------------
let g:unite_enable_start_insert = 1
let g:unite_source_file_mru_time_format = ""
nmap <C-l> :Unite -buffer-name=files buffer_tab file_mru file<CR>
nmap <C-o> :Unite outline<CR>
" less delay
let g:unite_update_time = 80

" Unite バッファで <Esc>x2 で終了
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>

" ===========================
"   基本的な設定
" ===========================
syntax on
let $GIT_SSL_NO_VERIFY = 'true' " Vundle対策

" ==========================
" 移動
" ==========================
imap {} {}<Left>
imap [] []<Left>
imap () ()<Left>
imap "" ""<Left>
imap '' ''<Left>
imap $$ $$<Left>
imap <> <><Left>
map j       gj
map k       gk
map <Up>    g<Up>
map <Down>  g<Down>

" ==========================
" Color
" =========================
" ポップアップ表示
highlight Pmenu     ctermbg=darkred guibg=#4c745a
highlight PmenuSel  ctermbg=darkmagenta guibg=#d4b979
highlight PmenuSbar ctermbg=0 guibg=#333333

" 全角スペースと行末空白をハイライト
highlight ZenkakuSpace ctermbg=6
match ZenkakuSpace /\s\+$\|　/

"" CursorLine
"set cursorline
":hi CursorLine   ctermbg=darkblue guibg=darkblue
":hi CursorColumn ctermbg=darkblue guibg=darkblue
"autocmd WinEnter * setlocal cursorline
"autocmd WinLeave * setlocal nocursorline

colorscheme chela_light

hi LineNr ctermfg=darkgray

" ==========================
" 表示まわり
" =========================
set number
set nowrap
set nobackup
set noswapfile
set autoread

autocmd! BufWritePost ~/.vimrc source ~/.vimrc
augroup END

set autoindent smartindent
set smarttab
set softtabstop=4 tabstop=4 shiftwidth=4
set expandtab
set backspace=indent,eol,start
set ignorecase smartcase
set incsearch
" 最初にもどれ
set wrapscan
" 対応する括弧の表示
set showmatch
set showcmd
set showmode
set hlsearch
set wrapscan
set browsedir=buffer
set laststatus=2
set wildmode=list,full
set virtualedit+=block
set modeline
set splitbelow
set splitright
set scrolloff=10000000
if exists('&ambiwidth')
  set ambiwidth=double
endif

autocmd BufNewFile,BufRead *.psgi   set filetype=perl
autocmd BufNewFile,BufRead *.t      set filetype=perl
autocmd BufNewFile,BufRead *.json   set filetype=javascript
autocmd BufNewFile,BufRead *.coffee set filetype=coffee
autocmd BufNewFile,BufRead *.scss   set filetype=scss
autocmd BufNewFile,BufRead *.sql    set filetype=mysql
autocmd BufNewFile,BufRead *.tt     set filetype=html

"ステータスライン
set laststatus=2
let &statusline='[%F] %{GetEFstatus()} %{fugitive#statusline()}%=%{cfi#get_func_name()} @ %l %p%%'

function! GetEFstatus()
  let str = ''
  let fenc = ''
  let str = '[' . &fileformat . ']' 
  if &fileencoding != ''
    let str = str . '[' . &fileencoding . ']' 
  else
    let str = str . '[-]'
  endif
  unlet fenc
  return str 
endfunction

" Esc二回押しで検索ハイライト終了
nmap <ESC><ESC> :nohlsearch<CR><ESC>

" =========================
" Window
" =========================
" ウインドウサイズ
nnoremap + <C-W>+
nnoremap - <C-W>-
nnoremap ) <C-W>>
nnoremap ( <C-W><LT>

" split
command! N  :new
command! Vn :vnew

" =========================
" 入力
" =========================
" for perl
inoremap <C-d> $
inoremap <C-a> @


"yank and paste clipboard
nnoremap <silent> <Space>y :.w !pbcopy<CR><CR>
vnoremap <silent> <Space>y :w  !pbcopy<CR><CR>
nnoremap <silent> <Space>p :r  !pbpaste<CR>
vnoremap <silent> <Space>p :r  !pbpaste<CR>

"replace word under cursor with yanked string
nnoremap <silent> ciy ciw<C-r>0<ESC>:let@/=@1<CR>:noh<CR>
nnoremap <silent> cy   ce<C-r>0<ESC>:let@/=@1<CR>:noh<CR>

" ==========================
" Haml & Coffee
" =========================

function! CompileHaml()
    silent exe ":! perl ~/local/bin/compile_haml %"
endfunction

au BufWritePost *.haml,*.scss call CompileHaml()
au BufWritePost *.coffee silent CoffeeMake! -b | cwindow | redraw!
" au BufWritePost *.coffee :CoffeeCompile watch vert
command! CoffeePreview :CoffeeCompile watch vert
command! CP            :CoffeeCompile watch vert

nmap <Leader>c :CoffeeRun<CR>
au BufNewFile,BufReadPost *.coffee setl shiftwidth=2 expandtab
au BufNewFile,BufReadPost *.scss   setl shiftwidth=2 expandtab

" =======================
" Titanium
nmap <Leader>ti :call system('curl http://localhost:9090/run &')<CR>


" ==========================
" 文字コード
" =========================
if &encoding !=# 'utf-8'
  set encoding=japan
  set fileencoding=japan
endif
if has('iconv')
  let s:enc_euc = 'euc-jp'
  let s:enc_jis = 'iso-2022-jp'
  if iconv("\x87\x64\x87\x6a", 'cp932', 'eucjp-ms') ==# "\xad\xc5\xad\xcb"
    let s:enc_euc = 'eucjp-ms'
    let s:enc_jis = 'iso-2022-jp-3'
  elseif iconv("\x87\x64\x87\x6a", 'cp932', 'euc-jisx0213') ==# "\xad\xc5\xad\xcb"
    let s:enc_euc = 'euc-jisx0213'
    let s:enc_jis = 'iso-2022-jp-3'
  endif
  if &encoding ==# 'utf-8'
    let s:fileencodings_default = &fileencodings
	let &fileencodings = s:enc_jis .','. s:enc_euc .',cp932'
    let &fileencodings = &fileencodings .','. s:fileencodings_default
    unlet s:fileencodings_default
  else
    let &fileencodings = &fileencodings .','. s:enc_jis
    set fileencodings+=utf-8,ucs-2le,ucs-2
    if &encoding =~# '^\(euc-jp\|euc-jisx0213\|eucjp-ms\)$'
      set fileencodings+=cp932
      set fileencodings-=euc-jp
      set fileencodings-=euc-jisx0213
      set fileencodings-=eucjp-ms
      let &encoding = s:enc_euc
      let &fileencoding = s:enc_euc
    else
      let &fileencodings = &fileencodings .','. s:enc_euc
    endif
  endif
  unlet s:enc_euc
  unlet s:enc_jis
endif
if has('autocmd')
  function! AU_ReCheck_FENC()
    if &fileencoding =~# 'iso-2022-jp' && search("[^\x01-\x7e]", 'n') == 0
      let &fileencoding=&encoding
    endif
  endfunction
  autocmd BufReadPost * call AU_ReCheck_FENC()
endif
