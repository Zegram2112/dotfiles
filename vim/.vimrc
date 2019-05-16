set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" NERDTree
Plugin 'scrooloose/nerdtree'
" Pretty bar
Plugin 'itchyny/lightline.vim'
" Colorscheme like atom
Plugin 'rakr/vim-one'
" Colorscheme ayu
Plugin 'ayu-theme/ayu-vim'
" Syntax checking
Plugin 'scrooloose/syntastic'
" Syntax highlight for Twig
Plugin 'lumiliet/vim-twig'
" Latex for vim
Plugin 'lervag/vimtex'
" Colorscheme nord
Plugin 'arcticicestudio/nord-vim'
" Snippets
Plugin 'SirVer/ultisnips'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just
" :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to
" auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" Turn on syntax highlighting.
syntax on

" Automatically wrap text that extends beyond the screen length.
set wrap

" Default indentations settings
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set noshiftround
set autoindent
set smartindent

" Display 5 lines above/below the cursor when scrolling with a mouse.
set scrolloff=5
" Fixes common backspace problems
set backspace=indent,eol,start

" Speed up scrolling
set ttyfast

" Hightlight matching pairs
set showmatch

" Highlight matching pairs of brackets.
set matchpairs+=<:>

" Show line numbers
set number

" Config for statusline
set laststatus=2
let g:lightline= {
    \ 'colorscheme': 'nord'
    \ }

" True colors
if exists('$TMUX')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif
set termguicolors
set t_Co=256

" Background color fix
let &t_ut=''

" Colorscheme
" colorscheme one
" colorscheme ayu
colorscheme nord
" let ayucolor="light"
let ayucolor="mirage"
" let ayucolor="dark"
" set background=light
set background=dark
let g:one_allow_italics = 1
let g:nord_italic = 1
let g:nord_underline = 1
let g:nord_italic_comments = 1


" Encoding
set encoding=utf-8

" --- Searching ---

" Include matching uppercase words with lowercase search term
set ignorecase

" Include only uppercase words with uppercase search term
set smartcase

" Highlight matches
set hlsearch

" Search as characters are entered
set incsearch

" Turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>

" ----------------

" Turns on filetype detection and specific plugins
filetype plugin indent on

" Visual autocomplete for command menu
set wildmenu

" Redraw only when we need to
set lazyredraw

" --- Folding ---

set foldenable

" Show all folds by default and max fold level
set foldlevelstart=10
set foldnestmax=10

" Space to open and close folds
nnoremap <space> za

" Fold based on indent level
set foldmethod=indent

" --- Latex ---

let g:tex_favlor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
set conceallevel=0
let g:tex_conceal='abdmg'

" --- UltiSnips ---

let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger ='<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
let g:UltiSnipsEditSplit= "horizontal"
let g:UltiSnipsSnippetDirectories = [$HOME . '/.vim/UltiSnips']
augroup ultisnips_no_auto_expansion
    au!
    au VimEnter * au! UltiSnips_AutoTrigger
augroup END

" --- Shortcuts ---

" move vertically by visual line
nnoremap j gj
nnoremap k gk

" leader
let mapleader=","

" save session
nnoremap <leader>s :mksession<CR>

" NERDTree shortcut
nnoremap <leader>n :NERDTreeToggle<CR>

" Easier navigation 
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

