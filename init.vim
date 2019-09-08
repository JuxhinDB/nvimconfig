set nocompatible              " required
filetype off                  " required

set splitbelow
set splitright
set encoding=utf-8
set shell=/bin/zsh

let mapleader = "'"

" set the runtime path to include Vundle and initialize
set nu  " Line-numbering
filetype plugin indent on    " required

" Set splitting keymapping
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Save, Exit w/Save, Exit w/o Save shortcuts
noremap <Leader>w :w<CR>
noremap <Leader>q :wq<CR>
noremap <Leader>e :q!<CR>


" Use same clipboard as system clipboard 
vnoremap <leader>y "+y" 
nnoremap <leader>y "+y"
nnoremap <leader>p "+p"
vnoremap <leader>p "+p" 

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

"" PLUGIN MANAGEMENT
packadd minpac
call minpac#init()

" Managed plugins (automated installed and update via "Pu" and "Pc")

call minpac#add('gmarik/Vundle.vim')
call minpac#add('vim-scripts/indentpython.vim')
call minpac#add('vim-syntastic/syntastic')
call minpac#add('nvie/vim-flake8') " PEP8
call minpac#add('jistr/vim-nerdtree-tabs') " File-tree 
call minpac#add('kien/ctrlp.vim') " Global super-search
call minpac#add('tpope/vim-fugitive') " Git integration
call minpac#add('racer-rust/vim-racer') " Rust Racer

command! Pu call minpac#update()
command! Pc call minpac#clean()

"" ADDITIONAL CONFIGURATION

" Spelling
nnoremap <leader>sp :set spell<CR>
nnoremap <leader>s ]s
nnoremap <leader>f 1z=


" Kill the arrow keys
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
