set nocompatible
filetype off

call plug#begin('~/.vim/plugged')
Plug 'phpactor/phpactor', {'for': 'php', 'tag': '*', 'do': 'composer install --no-dev -o'}
Plug 'StanAngeloff/php.vim'
Plug 'mhinz/vim-mix-format'
Plug 'mfussenegger/nvim-dap'
Plug 'morhetz/gruvbox'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'lewis6991/gitsigns.nvim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-rails'
Plug 'preservim/nerdtree'
Plug 'stephpy/vim-yaml'
Plug 'Yggdroot/indentLine'
Plug 'christoomey/vim-tmux-navigator'
Plug 'mattn/emmet-vim'
Plug 'elixir-editors/vim-elixir'
Plug 'preservim/nerdcommenter'
Plug 'tpope/vim-endwise'
Plug 'sainnhe/sonokai'
Plug 'preservim/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'sgur/vim-editorconfig'
Plug 'honza/vim-snippets'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-dispatch'
Plug 'tanvirtin/vgit.nvim'
Plug 'getomni/neovim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'phaazon/hop.nvim'
Plug 'mfussenegger/nvim-dap'
Plug 'kyazdani42/nvim-web-devicons'
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
set linespace=8
set guifont=DroidSansMono\ Nerd\ Font\ 12
set rtp+=/usr/local/opt/fzf
set termguicolors
set background=dark

let NERDTreeShowHidden=1
let mapleader=";"
set termguicolors

let g:sonokai_style = 'andromeda'
let g:sonokai_enable_italic = 1
let g:sonokai_transparent_background = 1
let g:gruvbox_transparent_bg = 1


colorscheme gruvbox

hi! Normal ctermbg=NONE guibg=NONE
let g:fzf_buffers_jump=1
let g:fzf_commits_log_options= '--graph --color=always --format="%C(auto)%h%d %s" %C(black)%C(bold)%cr'
let g:fzf_tags_command = 'ctags -R'
let g:fzf_commands_expect = 'alt-enter,ctrl-x'
let g:airline_theme='fruit_punch'

let g:php_cs_fixer_path = "~/.config/composer/vendor/bin/php-cs-fixer"
let g:php_cs_fixer_rules = "@PSR2"

let g:prettier#autoformat = 1

let g:fzf_layout = { 'window': { 'width': 0.5, 'height': 0.5, 'highlight': 'Comment'  } }

"Quit all!
map <leader>q <ESC>:qa<CR>
map <leader>w <ESC>:w!<CR>

nnoremap <silent> <leader>f <cmd>Files<cr>
nnoremap <BS> :b#<CR>

nmap 44 $
map <leader>n <ESC>:edit ~/.config/nvim/init.vim<CR>
map <silent> <leader>r <ESC>:source ~/.config/nvim/init.vim<CR>

set splitbelow

"NERDTREE
nnoremap <silent> <leader>e :NERDTreeToggle<Enter>

let g:NERDTreeAutoDeleteBuffer = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeDirArrows = 1
set wildignore+=*/min/*,*/vendor/*,*/node_modules/*,*/bower_components/*
set relativenumber
highlight CursorLineNr guifg=#f7b3a1
highlight Comment gui=none

nnoremap <leader>h :History<CR>

"Key bindings
nnoremap <tab> <ESC>gt
inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>
inoremap jk <Esc>

let g:LanguageClient_serverCommands = {
    \ 'elixir': ['~/.elixir-ls/release/language_server.sh'],
    \ 'javascript': ['/usr/local/bin/javascript-typescript-stdio'],
    \ 'javascript.jsx': ['tcp://127.0.0.1:2089'],
    \ }

set autoindent
set smartindent

let g:user_emmet_expandabbr_key='<Tab>'
imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")

let g:NERDTreeWinPos = "right"

set grepprg=rg\ --vimgrep\ --smart-case\ --hidden\ --follow
set t_Co=256

set guifont=Fira\ Code\ Retina:h16
autocmd FileType javascript setlocal ts=2 sts=2 sw=2
autocmd FileType javascript.jsx setlocal shiftwidth=2 softtabstop=2 expandtab

autocmd BufEnter *.{js,jsx,ts,tsx,ex,eex,erb,rb} :syntax sync fromstart
autocmd BufEnter *.{js,jsx,ts,tsx,ex,eex,erb,rb} :syntax sync clear
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
let g:indentLine_char = '⦙'
"let g:indentLine_char = '|'
let g:mix_format_on_save = 1

" CoC config
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nnoremap <silent> K :call CocAction('definitionHover')<CR>

nnoremap <silent> <leader>b :lua require'dap'.toggle_breakpoint() <cr>
nnoremap <silent> <leader>d :lua require'dap'.continue() <cr>
nnoremap <silent> <leader>T :lua require'dap'.step_over() <cr>
nnoremap <silent> <leader>t :lua require'dap'.step_into() <cr>
nnoremap <silent> <leader>R :lua require'dap'.repl.open() <cr>


lua << EOF
require('gitsigns').setup()

local dap = require('dap')

-- GO config
dap.adapters.go = {
  type = 'executable';
  command = 'node';
  args = {os.getenv('HOME') .. '/dev/golang/vscode-go/dist/debugAdapter.js'};
}
dap.configurations.go = {
  {
    type = 'go';
    name = 'Debug';
    request = 'launch';
    showLog = false;
    program = "${file}";
    dlvToolPath = vim.fn.exepath('dlv')  -- Adjust to where delve is installed
  },
}
-- GO Config end
-- place this in one of your configuration file(s)
require'nvim-web-devicons'.setup{}
require'nvim-web-devicons'.get_icons()

require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all"
  ensure_installed = { "elixir", "php", "javascript", "typescript" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = true,

  -- Automatically install missing parsers when entering buffer
  auto_install = true,

  -- List of parsers to ignore installing (for "all")

  highlight = {
    -- `false` will disable the whole extension
    enable = true,

    -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
    -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
    -- the name of the parser)
    -- list of language that will be disabled

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}
EOF


