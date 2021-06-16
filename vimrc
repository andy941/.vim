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

" deactivate annoying error sounds.
set noerrorbells

" set tabs to be 4 spaces. expand tab will extend the beahviour and correct
" indenting to insert mode.
set tabstop=4 softtabstop=4
set shiftwidth=4
set noexpandtab
set autoindent

" display line numbers on the left side of the editor.
set nu
set relativenumber

" do not wrap phrases when they reach the screen limit.
set nowrap

" case sensitive search only when one of the letters is uppercase.
set smartcase

" Give more space for displaying messages.
"set cmdheight=2

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

" get rid of the highlighting by pressing cher return
nnoremap <cr> :noh<cr>

" fold indented code
set nofoldenable
set foldmethod=syntax

" show dropdown menu when autocompleting in the :command line
set wildchar=<Tab> wildmenu wildmode=full


"-----------------------------------------------------------------------
" VIMPLUG
" vim plug in manager automate installation

if empty(glob('~/.vim/autoload/plug.vim'))

  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs

    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC

endif

" begin to plug-in stuff
call plug#begin('~/.vim/plugged')

Plug 'morhetz/gruvbox'
Plug 'ycm-core/YouCompleteMe'
Plug 'vim-utils/vim-man'
Plug 'jupyter-vim/jupyter-vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'gorodinskiy/vim-coloresque'

call plug#end() 


"-----------------------------------------------------------------------
" COLORSCHEME

" use a colorscheme
let g:gruvbox_contrast_dark='hard'

colorscheme gruvbox
set background=dark
" set termguicolors


"-----------------------------------------------------------------------
" AIRLINE
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#whitespace#enabled = 0

" air-line
let g:airline_powerline_fonts = 1

 if !exists('g:airline_symbols')
     let g:airline_symbols = {}
     endif

"" unicode symbols
"let g:airline_left_sep = '»'
"let g:airline_left_sep = '▶'
"let g:airline_right_sep = '«'
"let g:airline_right_sep = '◀'
"let g:airline_symbols.linenr = '␊'
"let g:airline_symbols.linenr = '␤'
"let g:airline_symbols.linenr = '¶'
"let g:airline_symbols.branch = '⎇'
"let g:airline_symbols.paste = 'ρ'
"let g:airline_symbols.paste = 'Þ'
"let g:airline_symbols.paste = '∥'
"let g:airline_symbols.whitespace = 'Ξ'
"
"
"" airline symbols
"let g:airline_left_sep = ''
"let g:airline_left_alt_sep = ''
"let g:airline_right_sep = ''
"let g:airline_right_alt_sep = ''
"let g:airline_symbols.branch = ''
"let g:airline_symbols.readonly = ''
"let g:airline_symbols.linenr = ''


"-----------------------------------------------------------------------
" YouCompletMe
" Small tweaks to help YCM look and feel better

" don't open preview window when showing info, open another popup
set completeopt=menuone,longest,popup

" Both of the following are equivalent, nice syntax highlighting for C and C++
" pop up windows.
autocmd FileType c,cpp,python let b:ycm_hover = { 'command': 'GetDoc', 'syntax': &syntax }
"augroup MyYCMCustom
"	autocmd!
"	autocmd FileType c,cpp,py let b:ycm_hover = {
"				\ 'command': 'GetDoc',
"				\ 'syntax': &filetype
"				\ }
"augroup END

nnoremap  <c-]> :YcmCompleter GoTo<CR>


"-----------------------------------------------------------------------
" USEFUL REMAPS
"
" autocomplete path insert mode (with TAB)
inoremap <Tab> <C-X><C-F>

" remaps for jupyter-vim
let g:jupyter_mapkeys = 0

" Run current file
nnoremap <buffer> <silent> <Tab>r :JupyterRunFile<CR>

" Send a selection of lines
nmap     <buffer> <silent> <Tab>e <Plug>JupyterRunTextObj
vmap     <buffer> <silent> <Tab>e <Plug>JupyterRunVisual
