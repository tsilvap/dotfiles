""" Plugins
call plug#begin('~/.vim/plugged')
Plug 'godlygeek/tabular'
Plug 'itchyny/lightline.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'kristijanhusak/vim-hybrid-material'
Plug 'lepture/vim-jinja'
Plug 'mattn/emmet-vim'
Plug 'morhetz/gruvbox'
Plug 'pangloss/vim-javascript'
Plug 'plasticboy/vim-markdown'
Plug 'posva/vim-vue'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-surround'
Plug 'vim-python/python-syntax'
Plug 'w0rp/ale'
call plug#end()

""" Line numbers
set number

""" Color scheme
set background=dark
colorscheme hybrid_material
let g:enable_bold_font = 1
let g:enable_italic_font = 1

""" Indentation
filetype indent on
set tabstop=8
set softtabstop=4
set shiftwidth=4
set expandtab

""" Filetype specifics
autocmd Filetype html,jinja.html,css,scss,javascript,vue,vuejs setlocal shiftwidth=2 softtabstop=2
autocmd Filetype markdown execute ':set tw=72'
autocmd Filetype markdown execute ':set fo-=l'

""" ALE
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['eslint'],
\   'json': ['fixjson'],
\   'vue': ['eslint'],
\   'vuejs': ['eslint'],
\   'scss': ['stylelint'],
\   'python': ['autopep8', 'isort', 'black'],
\}
let g:ale_lint_on_text_changed = 0
let g:ale_lint_on_insert_leave = 0
let g:ale_lint_on_enter = 0
let g:ale_lint_on_save = 1
let g:ale_lint_on_filetype_changed = 0
let g:ale_fix_on_save = 1
let g:ale_python_pylint_options = '--load-plugins pylint_django'
nmap <F8> <Plug>(ale_fix)

""" Lightline
set laststatus=2
set noshowmode

""" NERDCommenter
filetype plugin on
let g:NERDDefaultAlign = 'left'
let g:NERDSpaceDelims = 1

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
