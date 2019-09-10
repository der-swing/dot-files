filetype plugin indent on
filetype indent on
syntax on

set nocompatible
set autoindent
set smartindent
set incsearch
set mouse=a
set shortmess+=c
set smartcase
set textwidth=80
set autowrite
set lazyredraw

colorscheme molokai

let mapleader = ","
nnore <Leader>r :source $MYVIMRC<CR>
nnore <Leader>w :w<CR>
nnore <Leader>q :bd<CR>
nnore Q @@

nnore <PAGEUP> <C-u>
nnore <PAGEDOWN> <C-d>

" quick movement within buffers
nnore gb :bn<CR>
nnore gB :bp<CR>
nnore <Leader>f :ls<CR>:b 

nnore <Leader><Space> :noh<CR>
inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u
" copying in a more sane way
inoremap <C-v> <C-r>*
vnoremap <C-c> "*y<CR>

map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>
" sane copying of text in visual mode
nnoremap <leader>a :cclose<CR>
autocmd FileType go nmap <leader>b  <Plug>(go-build)
autocmd FileType go nmap <leader>r  <Plug>(go-run)


" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'fatih/vim-go'
Plugin 'tomasr/molokai'
" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

function! MinimalMode()
	set nonumber 
	set noshowmode
	set noruler
	set laststatus=0
	set noshowcmd
endfunction

function! NormalMode()
	set number
	set relativenumber
	set showmode
	set ruler
	set laststatus=2
	set showcmd
endfunction

call NormalMode()

" Statusline configuration
hi StatusLine ctermfg=232 ctermbg=250
set statusline=\ %f
set statusline+=\ %r
set statusline+=\ %y
set statusline+=\ %m
set statusline+=\ %#warningmsg#

" Make 81st column stand out
highlight ColorColumn ctermbg=magenta
call matchadd('ColorColumn', '\%81v', 100)


autocmd filetype tex call TexOptions()
function! TexOptions()
	set tabstop=4
    map <F5> :w <CR> :!pdflatex %<CR>
endfunction

autocmd filetype groff call GroffOptions()
function! GroffOptions()
	set tabstop=4
    nmap <F5> :!make<CR>
endfunction

autocmd filetype matlab call MatlabOptions()
function! MatlabOptions()
		set tabstop=4 softtabstop=0 shiftwidth=4 smarttab
endfunction


autocmd filetype sh call ShOptions()
function! ShOptions()
	set tabstop=4
endfunction

au BufNewFile,BufRead *.groff set filetype=groff
au BufNewFile,BufRead *.roff set filetype=groff
au BufNewFile,BufRead *.ms set filetype=groff

let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_quiet_messages = {'type': 'style'}

iab chrystal crystal
iab fibre fiber
