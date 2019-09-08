set nocompatible              " required
filetype off                  " required

set splitbelow
set splitright
set encoding=utf-8

" set the runtime path to include Vundle and initialize
set nu  " Line-numbering
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'vim-syntastic/syntastic'
Plugin 'nvie/vim-flake8'  " PEP8
Plugin 'jistr/vim-nerdtree-tabs'  " File-tree 
Plugin 'kien/ctrlp.vim'  " Global super-search
Plugin 'tpope/vim-fugitive'  " Git integration

" Python auto-complete plugin
Bundle 'Valloric/YouCompleteMe'

" add all your plugins here (note older versions of Vundle
" used Bundle instead of Plugin)

" ...

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Set splitting keymapping
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Auto-indent for python files due to PEP8
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix |

" Auto-indent for not Python files
au BufNewFile,BufRead *.js, *.html, *.css *.rs
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2 |

" Flag unnecessary whitespace (PEP8)
highlight BadWhitespace ctermbg=red guibg=red
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h,*.rs match BadWhitespace /\s\+$/

" Customisation for YouCompleteMe bundle
let g:ycm_autoclose_preview_window_after_completion=1
let mapleader=" "
map <leader>g	:YcmCompleter GoToDefinitionElseDeclaration<CR>

" Make Python code look pretty
let python_highlight_all=1

let NERDTreeIgnore=['\.pyc$', '\~$']  " Ignore certain files in NERDTree
map <C-n> :NERDTreeToggle<CR>

syntax on
