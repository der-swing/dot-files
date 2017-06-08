
filetype plugin indent on
filetype indent on
syntax on

set nocompatible
set autoindent
set smartindent
set incsearch
set ignorecase
set showmatch
set shortmess+=c
set textwidth=80
highligh ColorColumn ctermbg=magenta
call matchadd('ColorColumn', '\%81v', 100)
set noswapfile

set wildmenu
set wildignorecase
set wildmode=list:longest
set wildignore+=.hg,.git,.svn
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg
set path=.,**

" Don't show a ~ for blank lines
hi NonText ctermfg=white

let g:myLang = 0
let g:myLangList = ['nospell', 'de_de', 'en_us']

" spellchecker de/en
function! MySpellLang()
		"loop through languages
		if g:myLang == 0 | setlocal nospell | endif
		if g:myLang == 1 | let &l:spelllang = g:myLangList[g:myLang] | setlocal spell | endif
		if g:myLang == 2 | let &l:spelllang = g:myLangList[g:myLang] | setlocal spell | endif
		echomsg 'language:' g:myLangList[g:myLang]
		let g:myLang = g:myLang + 1
		if g:myLang >= len(g:myLangList) | let g:myLang = 0 | endif
endfunction
map <F7> :<C-U>call MySpellLang()<CR>

let mapleader = ","
nnore <Leader>r :source ~/.vimrc<CR>
nnore <Leader>w :w<CR>
nnore <Leader>q :wq<CR>
nnore <Leader>Q :q!<CR>

nnore <Leader>p :set paste!<CR>
nnore <Leader>v <C-S-v>
nnore <Leader><Space> :nohls<CR>
inore  <right>

nnore tp :set paste!<CR>

nnore <Up> :echo 'Arrow keys are for noobs'<CR>
nnore <Down> :echo 'Arrow keys are for noobs'<CR>
nnore <Left> :echo 'Arrow keys are for noobs'<CR>
nnore <Right> :echo 'Arrow keys are for noobs'<CR>

nnore <PAGEUP> <C-u>
nnore <PAGEDOWN> <C-d>

nnore <Leader>m :call MinimalMode()<CR>
nnore <Leader>n :call NormalMode()<CR>

function! MinimalMode()
	set nonumber 
	set norelativenumber
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

autocmd filetype vim call VimOptions()
function! VimOptions()
	set tabstop=4
	iab func function!<CR>endfunction<Esc>kA
endfunction

autocmd filetype markdown call MarkdownOptions()
function! MarkdownOptions()
    set tabstop=4
	set noexpandtab
	inoreab _0 ₀
	inoreab pi π
	inoreab lambda λ
	inoreab alpha α
	inoreab beta β
	inoreab theta θ
	inoreab .M ·
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

ab löä derpaulito@gmail.com
ab opü pkauf@physik.hu-berlin.de
ab huzb Huboldt-Universität zu Berlin
