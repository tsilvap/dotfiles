""" Plugins
call plug#begin('~/.vim/plugged')
Plug 'godlygeek/tabular'
Plug 'itchyny/lightline.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'lepture/vim-jinja'
Plug 'mattn/emmet-vim'
Plug 'morhetz/gruvbox'
Plug 'pangloss/vim-javascript'
Plug 'plasticboy/vim-markdown'
Plug 'python/black'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-surround'
Plug 'vim-python/python-syntax'
call plug#end()

""" Line numbers
set number

""" Indentation
filetype indent on
set tabstop=8
set softtabstop=4
set shiftwidth=4
set expandtab

""" Filetype specifics
autocmd BufWritePre *.py execute ':Black'
autocmd Filetype javascript setlocal shiftwidth=2 softtabstop=2
autocmd Filetype markdown execute ':set tw=72'
autocmd Filetype markdown execute ':set fo-=l'

""" Lightline
set laststatus=2
set noshowmode

""" NERDCommenter
filetype plugin on

""" NERDTree
map <C-n> :NERDTreeToggle<CR>
" Close Vim automatically if only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

""" Python Syntax
let g:python_highlight_all = 1
let g:python_highlight_space_errors = 0

""" Vim Markdown
let g:vim_markdown_frontmatter = 1
let g:vim_markdown_folding_disabled = 1
