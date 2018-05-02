
filetype plugin indent on
filetype indent on
syntax on

set nocompatible
set autoindent
set smartindent
set incsearch
set shortmess+=c
set ignorecase
set spell
set textwidth=80

let mapleader = ","
nnore <Leader>r :source $MYVIMRC<CR>
nnore <Leader>w :w<CR>
nnore <Leader>q :wq<CR>
nnore <Leader>Q :q!<CR>

nnore <Up> :echo 'Arrow keys are for noobs'<CR>
nnore <Down> :echo 'Arrow keys are for noobs'<CR>
nnore <Left> :echo 'Arrow keys are for noobs'<CR>
nnore <Right> :echo 'Arrow keys are for noobs'<CR>

nnore <PAGEUP> <C-u>
nnore <PAGEDOWN> <C-d>

nnore <Leader>m :call MinimalMode()<CR>
nnore <Leader>n :call NormalMode()<CR>
nnore <Leader>c :call NoConcealMode()<CR>
nnore <Leader>C :call ConcealMode()<CR>
nnore <Leader><Space> :noh<CR>

function! ConcealMode()
	set conceallevel=2 
endfunction

function! NoConcealMode()
	set conceallevel=0 
endfunction

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

" Remove trailing whitespace after abbreviations
function! Eatchar(pat)
      let c = nr2char(getchar(0))
      return (c =~ a:pat) ? '' : c
endfunction

colorscheme iawriter
" Make 81st column stand out
highlight ColorColumn ctermbg=magenta
call matchadd('ColorColumn', '\%81v', 100)

autocmd filetype vim call VimOptions()
function! VimOptions()
	set tabstop=4
	iab func function!<CR>endfunction<Esc>kA
endfunction


autocmd filetype c call COptions()
function! COptions()
	set tabstop=8
endfunction

autocmd filetype python call PythonOptions()
function! PythonOptions()
	set tabstop=4
	iab *** *args, **kwargs<C-R>=Eatchar('\s')<CR>

	iab info logging.info('')<Esc>hi<C-R>=Eatchar('\s')<CR>
	iab debug logging.debug('')<Esc>hi<C-R>=Eatchar('\s')<CR>
	iab warning logging.warning('')<Esc>hi<C-R>=Eatchar('\s')<CR>
	iab error logging.error('')<Esc>hi<C-R>=Eatchar('\s')<CR>
endfunction

autocmd filetype tex call TexOptions()
function! TexOptions()
	set tabstop=4
    map <F5> :w <CR> :!pdflatex %<CR>
endfunction

autocmd filetype matlab call MatlabOptions()
function! MatlabOptions()
		set tabstop=4 softtabstop=0 shiftwidth=4 smarttab
endfunction


autocmd BufWritePre,BufRead,BufNew *.asm :set filetype=nasm
autocmd filetype nasm call AsmOptions()
function! AsmOptions()
	set tabstop=4
	iab inc %include ""<Esc>i<C-R>=Eatchar('\s')<CR>
endfunction

autocmd filetype sh call ShOptions()
function! ShOptions()
	set tabstop=4
endfunction

let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_quiet_messages = {'type': 'style'}

" abkürzungen

iab huzb Huboldt-Universität zu Berlin
