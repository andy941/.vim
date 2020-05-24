
syntax on

" change cursor shape in insert/normal mode
let &t_SI = "\<Esc>[6 q" " INSERT - solid line
let &t_SR = "\<Esc>[4 q" " REPLACE - solid underscore
let &t_EI = "\<Esc>[2 q" " NORMAL(else) - solid square


" hides the files that has unsaved changes intead of forcing the user
" to save them immediately. the unsaved changes can still be accessed from the 
" buffer. To add a safety net, the buffers will be saved eveytime they are
" hidden.
set hidden
set autowriteall

" deactivateannoying error sounds.
set noerrorbells

" set tabs to be 4 spaces. expand tab will extend the beahviour and correct
" indenting to insert mode.
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab

" display line numbers on the left side of the editor.
set nu
set relativenumber

" do not wrap phrases when they reach the screen limit.
set nowrap

" case sensitive search only when one of the letters is uppercase.
set smartcase

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=50

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" display coordinates in bottom right corner
set ruler

" activate search highlight and incrementally search words while typing
set incsearch
set hlsearch

" fold indented code, vim will try to indent code nicely
set nofoldenable
set foldmethod=indent
set smartindent

" show dropdown menu when autocompleting in the :command line
set wildchar=<Tab> wildmenu wildmode=full

" vim plug in manager automate installation
if empty(glob('~/.vim/autoload/plug.vim'))

  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs

    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC

endif

" begin to plug-in stuff
call plug#begin('~/.vim/plugged')

Plug 'jcherven/jummidark.vim'
Plug 'ycm-core/YouCompleteMe'
Plug 'vim-utils/vim-man'
Plug 'preservim/nerdtree'
" Plug 'Xuyuanp/nerdtree-git-plugin'

call plug#end() 


" use a colorscheme
colorscheme jummidark
set background=dark

" open NerdTree automatically when Vim starts without opening a file
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" open NerdTree automatically when Vim starts 
" autocmd vimenter * NERDTree

" key binding to quickly search the tree
map <C-n> :NERDTreeToggle<CR>

" close NerdTree if it's the only open tab
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" make it prettier 
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

" If more than one window and previous buffer was NERDTree, go back to it.
autocmd BufEnter * if bufname('#') =~# "^NERD_tree_" && winnr('$') > 1 | b# | endif

" always put the cursr on the file, not on NerdTree. CAREFUL, if you open a
" tree everytime you open a file/directory, with obvious problems.
" I prefer to open the tree if a open a directory and not open it immediately
" when I open a file for editing. 
"autocmd VimEnter * NERDTree | wincmd p

" If you are using vim-plug, you'll also need to add these lines to avoid crashes when calling vim-plug functions while the cursor is on the NERDTree window:
let g:plug_window = 'noautocmd vertical topleft new'


" USEFUL REMAPS
"
" autocomplete path insert mode (with TAB)
inoremap <Tab> <C-X><C-F>


