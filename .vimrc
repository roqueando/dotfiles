set nocompatible
filetype off

call plug#begin('~/.vim/plugged')
Plug 'dracula/vim', { 'name': 'dracula'}
Plug 'sainnhe/sonokai'
Plug 'preservim/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'editorconfig/editorconfig-vim'
Plug 'stephpy/vim-php-cs-fixer'
Plug '2072/PHP-Indenting-for-VIm'    " PHP indent script
Plug 'Yggdroot/indentLine'           " highlighting 4sp indenting
Plug 'chrisbra/Colorizer'            " colorize colors
Plug 'mhinz/vim-signify'             " show VCS changes
Plug 'sheerun/vim-polyglot'          " newer language support
Plug 'w0rp/ale'                      " realtime linting
"Plug 'ryanoasis/vim-devicons'
Plug 'codehearts/mascara-vim'
Plug 'jiangmiao/auto-pairs'
Plug 'airblade/vim-gitgutter'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Plug 'jistr/vim-nerdtree-tabs'
Plug 'junegunn/fzf', {'dir': '~/.fzf', 'do': './install --all'}
Plug 'junegunn/fzf.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'phpactor/phpactor', {'for': 'php', 'branch': 'master', 'do': 'composer install --no-dev -o'}
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'janko-m/vim-test'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'epilande/vim-react-snippets'
Plug 'styled-components/vim-styled-components', { 'branch': 'main'  }
Plug 'prettier/vim-prettier', { 'do': 'yarn install'  }
"Plug 'c9s/phpunit.vim'
call plug#end()

filetype plugin indent on
syntax on

set path+=**
set wildmenu
set incsearch
set smartcase
set encoding=UTF-8
set number
set directory=/var/tmp
set visualbell
set hidden
set history=100
set autoindent
set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=4
set linespace=5
set guifont=DankMono
set rtp+=/usr/local/opt/fzf

let g:airline_powerline_fonts=0
let g:airline_theme = 'fruit_punch'
let g:airline_left_sep = "\uE0BC"
let g:airline_right_sep = "\uE0BE"
let g:airline#extensions#tabline#left_sep = "\uE0BC"
let g:airline#extensions#tabline#right_sep = "\uE0BE"
let NERDTreeShowHidden=1
let g:prettier#autoformat = 1
let mapleader=","
let g:dracula_colorterm = 0
let g:dracula_italic = 0

colorscheme sonokai

let g:fzf_buffers_jump=1
let g:fzf_commits_log_options= '--graph --color=always --format="%C(auto)%h%d %s" %C(black)%C(bold)%cr'
let g:fzf_tags_command = 'ctags -R'
let g:fzf_commands_expect = 'alt-enter,ctrl-x'
let g:php_cs_fixer_path = "~/.config/composer/vendor/bin/php-cs-fixer"
let g:php_cs_fixer_rules = "@PSR2"
let g:prettier#autoformat = 1
let g:fzf_layout = { 'down': '40%' }
let g:UltiSnipsExpandTrigger="<C-l>"
"let g:phpunit_testroot = 'tests'
"let g:phpunit_srcroot = 'src'
"let g:phpunit_options = ["--stop-on-failure"]

"Quit all!
map <leader>q <ESC>:qa<CR>
map <leader>s <ESC>:w!<CR>
map <leader>p <ESC>:Files<CR>
map <leader>n <ESC>:NERDTree<CR>
map <leader>g <ESC>:call CocAction('jumpDefinition')<CR>
nmap <leader>t <ESC> :terminal<CR> <ESC> :40winc+ <CR>

nmap 44 $
map <leader>e <ESC>:edit ~/.vimrc<CR>
map <leader>r <ESC>:source ~/.vimrc<CR>
nmap s <Plug>(easymotion-bd-f2)
nnoremap <silent><leader>ff :w <CR>:call PhpCsFixerFixFile()<CR>
"autocmd BufWritePost *.php silent! call PhpCsFixerFixFile()

let g:EasyMotion_use_smartsign_us = 1
let g:EasyMotion_smartcase = 1
let g:EasyMotion_verbose = 0
autocmd VimEnter * NERDTree
autocmd  FileType  php setlocal omnifunc=phpcomplete_extended#CompletePHP
set splitbelow

autocmd VimResized * wincmd =
if has('termguicolors')
  set termguicolors
endif

let g:sonokai_style = 'shusia'
let g:sonokai_enable_italic = 1
let g:sonokai_disable_italic_comment = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#tabline#enabled = 1

"NERDTREE
nnoremap <silent> <leader>f :NERDTreeToggle<Enter>
nnoremap <silent> <leader>v :NERDTreeFind<CR>

let g:NERDTreeAutoDeleteBuffer = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeDirArrows = 1
let g:NERDTreeDirArrowExpandable = '⭕'
let g:NERDTreeDirArrowCollapsible = '🔵'
set wildignore+=*/min/*,*/vendor/*,*/node_modules/*,*/bower_components/*
