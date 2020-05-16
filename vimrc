

set background=dark

"line numbers
set nu

"display line number in bottom right corner
set ruler

"activate search
set incsearch
set hlsearch

"fold indented code
set nofoldenable
set foldmethod=indent

"vim plug in manager
"automate installation

if empty(glob('~/.vim/autoload/plug.vim'))

  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs

    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC

endif

"begin to plug-in stuff

call plug#begin('~/.vim/plugged')

Plug 'jcherven/jummidark.vim'
Plug 'ycm-core/YouCompleteMe'
Plug 'vim-utils/vim-man'


call plug#end() 

"use a colorscheme

colorscheme jummidark


