set runtimepath+=/Users/cside/.vim/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('/Users/cside/.vim/dein')
  call dein#begin('/Users/cside/.vim/dein')

  " Let dein manage dein
  " Required:
  call dein#add('/Users/cside/.vim/dein/repos/github.com/Shougo/dein.vim')

  " Add or remove your plugins here:
  call dein#add('vim-scripts/fish.vim')
  call dein#add('Cside/molokai')

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
set expandtab
set tabstop=4
set shiftwidth=4
set noswapfile
set nobackup

" file types
autocmd BufRead,BufNewFile *.fish setfiletype fish

" shebang のあるファイルを保存時に自動で実行権限
autocmd BufWritePost * :call AddExecmod()
function AddExecmod()
    let line = getline(1)
    if strpart(line, 0, 2) == "#!"
        call system("chmod +x ". expand("%"))
    endif
endfunction
